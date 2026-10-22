<#
.SYNOPSIS
    Generates the Plushie Friends chest loot for the BuffoonCraft S7 datapack.

.DESCRIPTION
    1. Reads every plushie definition in datapack/data/<namespace>/plushies/*.json
       and builds <namespace>:plushies/all_plushies, a pool that picks one of them
       at equal weight.
    2. Pulls each matching vanilla chest loot table out of the Minecraft client jar,
       injects one extra pool ("chance" roll -> all_plushies) and writes it to
       datapack/data/minecraft/loot_table/. Vanilla pools are kept byte-for-byte.

    Lootr reads the same loot table IDs, so every player rolls the plushie pool
    independently the first time they open a given Lootr chest.

    This script OWNS datapack/data/minecraft/loot_table/ - it is wiped and
    regenerated on every run. Do not hand-edit files in there.

    Re-run after adding/removing plushies, changing the config, or updating the
    Minecraft version (the vanilla tables are re-read from the jar each time).

.PARAMETER ConfigPath
    Path to plushie-loot.config.json. Defaults to the file next to this script.

.EXAMPLE
    .\tools\plushie-loot\Build-PlushieLoot.ps1
#>
[CmdletBinding()]
param(
    [string]$ConfigPath = (Join-Path $PSScriptRoot 'plushie-loot.config.json')
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$RepoRoot    = Resolve-Path (Join-Path $PSScriptRoot '..\..')
$DatapackDir = Join-Path $RepoRoot 'datapack'
$LogPath     = Join-Path $PSScriptRoot 'Build-PlushieLoot.log'
$Utf8NoBom   = New-Object System.Text.UTF8Encoding $false

function Write-Log {
    param([string]$Message, [ValidateSet('INFO', 'WARN', 'ERROR')][string]$Level = 'INFO')
    $line = '{0} [{1}] {2}' -f (Get-Date -Format 'dd/MM/yyyy HH:mm:ss'), $Level, $Message
    $colour = @{ INFO = 'Gray'; WARN = 'Yellow'; ERROR = 'Red' }[$Level]
    Write-Host $line -ForegroundColor $colour
    Add-Content -Path $LogPath -Value $line -Encoding UTF8
}

# Writes UTF-8 (no BOM) with LF endings to match the vanilla files.
function Write-JsonText {
    param([string]$Path, [string]$Text)
    $dir = Split-Path $Path
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
    [IO.File]::WriteAllText($Path, ($Text -replace "`r`n", "`n"), $Utf8NoBom)
}

# Wildcard match against a list of patterns like "chests/*" or "chests/trial_chambers/reward*".
function Test-AnyMatch {
    param([string]$TableId, [string[]]$Patterns)
    foreach ($p in $Patterns) { if ($TableId -like $p) { return $true } }
    return $false
}

try {
    Set-Content -Path $LogPath -Value '' -Encoding UTF8
    Write-Log "Config: $ConfigPath"

    # --- Config ---------------------------------------------------------------
    if (-not (Test-Path $ConfigPath)) { throw "Config not found: $ConfigPath" }
    $config    = Get-Content $ConfigPath -Raw | ConvertFrom-Json
    $namespace = $config.namespace
    $jarPath   = [Environment]::ExpandEnvironmentVariables($config.minecraftJar)
    $poolId    = "${namespace}:plushies/all_plushies"

    if (-not (Test-Path $jarPath)) { throw "Minecraft jar not found: $jarPath (set minecraftJar in the config)" }

    $chanceOverrides = @{}
    foreach ($prop in $config.chanceOverrides.PSObject.Properties) { $chanceOverrides[$prop.Name] = [double]$prop.Value }

    # --- Plushie definitions --------------------------------------------------
    $plushieDir = Join-Path $DatapackDir "data\$namespace\plushies"
    $defs = @(if (Test-Path $plushieDir) { Get-ChildItem $plushieDir -Filter '*.json' -File | Sort-Object Name })
    if ($defs.Count -eq 0) { throw "No plushie definitions in $plushieDir - add at least one before generating." }

    $entries = foreach ($def in $defs) {
        $id = $def.BaseName
        if ($id -notmatch '^[a-z0-9_.\-]+$') { throw "Invalid plushie ID '$id' - file names must be lowercase a-z, 0-9, _ . -" }

        $json = Get-Content $def.FullName -Raw | ConvertFrom-Json
        if (-not $json.PSObject.Properties['owner_name'] -or [string]::IsNullOrWhiteSpace($json.owner_name)) {
            throw "$($def.Name) is missing owner_name"
        }

@"
        {
          "type": "minecraft:item",
          "name": "plushie_friends:plushie",
          "modifier": {
            "type": "plushie_friends:set_plushie",
            "id": "${namespace}:$id"
          }
        }
"@.TrimEnd()
    }

    $allPlushies = @"
{
  "type": "minecraft:generic",
  "pools": [
    {
      "entries": [
$($entries -join ",`n")
      ],
      "rolls": 1
    }
  ]
}
"@
    Write-JsonText (Join-Path $DatapackDir "data\$namespace\loot_table\plushies\all_plushies.json") $allPlushies
    Write-Log "Built $poolId with $($defs.Count) plushie(s)"

    # --- Vanilla chest overrides ----------------------------------------------
    $outRoot = Join-Path $DatapackDir 'data\minecraft\loot_table'
    if (Test-Path $outRoot) { Remove-Item $outRoot -Recurse -Force }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead($jarPath)
    $prefix = 'data/minecraft/loot_table/'
    $written = 0

    try {
        foreach ($entry in $zip.Entries | Where-Object { $_.FullName.StartsWith($prefix) -and $_.FullName.EndsWith('.json') }) {
            $tableId = $entry.FullName.Substring($prefix.Length) -replace '\.json$', ''
            if (-not (Test-AnyMatch $tableId $config.includeTables)) { continue }
            if (Test-AnyMatch $tableId $config.excludeTables) { continue }

            $chance = if ($chanceOverrides.ContainsKey($tableId)) { $chanceOverrides[$tableId] } else { [double]$config.defaultChance }
            if ($chance -le 0) { Write-Log "Skipping minecraft:$tableId (chance 0)"; continue }

            $reader = New-Object IO.StreamReader($entry.Open())
            try { $vanilla = $reader.ReadToEnd() } finally { $reader.Dispose() }

            # Every vanilla table has exactly one "pools": [ - bail if that ever changes.
            $marker = '"pools": ['
            $hits = ([regex]::Matches($vanilla, [regex]::Escape($marker))).Count
            if ($hits -ne 1) { Write-Log "Skipping minecraft:${tableId} - expected 1 pools array, found $hits" 'WARN'; continue }

            $chanceText = $chance.ToString([Globalization.CultureInfo]::InvariantCulture)
            $pool = @"
$marker
    {
      "condition": {
        "type": "minecraft:random_chance",
        "chance": $chanceText
      },
      "entries": [
        {
          "type": "minecraft:loot_table",
          "value": "$poolId"
        }
      ],
      "rolls": 1
    },
"@
            $patched = $vanilla.Replace($marker, $pool.TrimEnd())
            $null = $patched | ConvertFrom-Json   # throws if we produced invalid JSON

            Write-JsonText (Join-Path $outRoot ($tableId + '.json')) $patched
            $written++
            Write-Log ("minecraft:{0} <- {1:P1}" -f $tableId, $chance)
        }
    }
    finally {
        $zip.Dispose()
    }

    if ($written -eq 0) { throw 'No vanilla tables matched includeTables - check the config.' }
    Write-Log "Done. $written chest table(s) patched. Rezip the datapack and /reload to apply."
}
catch {
    Write-Log $_.Exception.Message 'ERROR'
    exit 1
}
