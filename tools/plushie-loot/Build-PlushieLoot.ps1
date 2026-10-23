<#
.SYNOPSIS
    Generates the Plushie Friends chest loot for the BuffoonCraft S7 datapack.

.DESCRIPTION
    1. Reads every plushie definition in datapack/data/<namespace>/plushies/*.json
       and builds <namespace>:plushies/all_plushies, a pool that picks one of them
       at equal weight. Each plushie is also tagged {buffooncraft_plushie:"<id>"}
       in custom_data so advancements can identify it.
    2. Builds the <namespace>:plushies/* advancement tab (BC logo icon): "first
       plushie" (tab root), one advancement per plushie (title/description from
       the config's "advancements" block, icon = that player's plushie with their
       skin fetched from the Mojang API so it renders on servers too) and a
       "full set" challenge. First/full set play buffoon:plushie.* sounds via
       reward functions. Each plushie matches on our tag OR PlushieOwner.name, so
       one that has been placed and broken (which drops our tag) still counts.
    3. Pulls each matching vanilla chest loot table out of the Minecraft client jar,
       injects a "chance" roll for all_plushies and one for <namespace>:sherds/all_sherds
       (every pottery sherd in that version, read from the jar), and writes it to
       datapack/data/minecraft/loot_table/. Vanilla pools are kept byte-for-byte.

    Lootr reads the same loot table IDs, so every player rolls the plushie pool
    independently the first time they open a given Lootr chest.

    This script OWNS datapack/data/minecraft/loot_table/ and
    datapack/data/<namespace>/advancement/plushies/ and function/plushies/ - all are wiped and
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
    [string]$ConfigPath
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# $PSScriptRoot is empty in param defaults under Windows PowerShell 5.1 -File, so resolve here.
if (-not $ConfigPath) { $ConfigPath = Join-Path $PSScriptRoot 'plushie-loot.config.json' }

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

    $plushies = foreach ($def in $defs) {
        $id = $def.BaseName
        if ($id -notmatch '^[a-z0-9_.\-]+$') { throw "Invalid plushie ID '$id' - file names must be lowercase a-z, 0-9, _ . -" }

        $json = Get-Content $def.FullName -Raw | ConvertFrom-Json
        if (-not $json.PSObject.Properties['owner_name'] -or [string]::IsNullOrWhiteSpace($json.owner_name)) {
            throw "$($def.Name) is missing owner_name"
        }
        if ($json.owner_name -notmatch '^[A-Za-z0-9_]{1,16}$') { throw "$($def.Name) has an invalid Minecraft username: $($json.owner_name)" }
        [pscustomobject]@{ Id = $id; Owner = $json.owner_name }
    }

    # set_custom_data runs after set_plushie so it merges into the plushie's own custom_data.
    $entries = foreach ($p in $plushies) {
@"
        {
          "type": "minecraft:item",
          "name": "plushie_friends:plushie",
          "modifier": [
            {
              "type": "plushie_friends:set_plushie",
              "id": "${namespace}:$($p.Id)"
            },
            {
              "type": "minecraft:set_custom_data",
              "tag": "{buffooncraft_plushie:\"$($p.Id)\"}"
            }
          ]
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

    # --- Advancements ---------------------------------------------------------
    $advDir = Join-Path $DatapackDir "data\$namespace\advancement\plushies"
    $fnDir  = Join-Path $DatapackDir "data\$namespace\function\plushies"
    foreach ($d in $advDir, $fnDir) { if (Test-Path $d) { Remove-Item $d -Recurse -Force } }

    # inventory_changed criterion for a plushie whose custom_data contains $Snbt (partial match).
    function Get-PlushieCriterion {
        param([string]$Snbt)
        $escaped = $Snbt.Replace('"', '\"')
@"
{
      "conditions": {
        "items": [
          {
            "items": "plushie_friends:plushie",
            "predicates": {
              "minecraft:custom_data": "$escaped"
            }
          }
        ]
      },
      "trigger": "minecraft:inventory_changed"
    }
"@.TrimEnd()
    }

    # Reward functions play the sound events defined in texturepack/assets/buffoon/sounds.json.
    $sounds = @{ first_found = 'buffoon:plushie.first_found'; full_set = 'buffoon:plushie.full_set' }
    foreach ($name in $sounds.Keys) {
        Write-JsonText (Join-Path $fnDir "$name.mcfunction") "playsound $($sounds[$name]) master @s ~ ~ ~ 1 1 1`n"
    }

    # Tab icon / root: the BC logo (texturepack item model buffoon:bc_logo on a paper base).
    $rootId = "${namespace}:plushies/first_found"
    Write-JsonText (Join-Path $advDir 'first_found.json') @"
{
  "criteria": {
    "any_plushie": {
      "conditions": {
        "items": [
          {
            "items": "plushie_friends:plushie"
          }
        ]
      },
      "trigger": "minecraft:inventory_changed"
    }
  },
  "display": {
    "background": "minecraft:gui/advancements/backgrounds/husbandry",
    "description": "Find your first plushie",
    "icon": {
      "id": "minecraft:paper",
      "components": {
        "minecraft:item_model": "buffoon:bc_logo"
      }
    },
    "title": "I Choose You!"
  },
  "requirements": [
    [
      "any_plushie"
    ]
  ],
  "rewards": {
    "function": "${namespace}:plushies/first_found"
  }
}
"@

    # Granted alongside the root so players learn there's a whole set to hunt for.
    # The per-plushie advancements and the full set hang off this one.
    $hintId = "${namespace}:plushies/more_to_find"
    Write-JsonText (Join-Path $advDir 'more_to_find.json') @"
{
  "parent": "$rootId",
  "criteria": {
    "any_plushie": {
      "conditions": {
        "items": [
          {
            "items": "plushie_friends:plushie"
          }
        ]
      },
      "trigger": "minecraft:inventory_changed"
    }
  },
  "display": {
    "description": "$($plushies.Count) Buffoons are hiding in chests across the world. Can you find them all?",
    "frame": "goal",
    "icon": {
      "id": "plushie_friends:plushie"
    },
    "title": "There's More Out There"
  },
  "requirements": [
    [
      "any_plushie"
    ]
  ]
}
"@

    # Icon rendered with the owner's skin. A name-only PlushieOwner only works in single player:
    # the mod resolves names into a server-side cache it never syncs, so on a dedicated server
    # clients fall back to the default skin. Baking the Mojang profile (id + signed textures)
    # into the icon lets the client load the skin itself. Re-run after a player changes skin.
    function Get-PlushieIcon {
        param([string]$Owner)
        $ownerSnbt = 'name:"' + $Owner + '"'
        try {
            $user = Invoke-RestMethod "https://api.mojang.com/users/profiles/minecraft/$Owner" -TimeoutSec 15
            $prof = Invoke-RestMethod "https://sessionserver.mojang.com/session/minecraft/profile/$($user.id)?unsigned=false" -TimeoutSec 15
            $tex  = @($prof.properties | Where-Object { $_.name -eq 'textures' })[0]
            if (-not $tex) { throw 'no textures property' }
            # UUID as the int-array form the profile codec expects.
            $ints = 0..3 | ForEach-Object { [Convert]::ToInt32($user.id.Substring($_ * 8, 8), 16) }
            $ownerSnbt += ',id:[I;' + ($ints -join ',') + '],properties:[{name:"textures",value:"' + $tex.value + '",signature:"' + $tex.signature + '"}]'
            Write-Log "Baked skin for $Owner into advancement icon"
        }
        catch { Write-Log "Couldn't fetch Mojang profile for $Owner ($($_.Exception.Message)) - icon will show the default skin on servers" 'WARN' }
        $snbt = ('{PlushieOwner:{' + $ownerSnbt + '}}').Replace('"', '\"')
@"
{
      "id": "plushie_friends:plushie",
      "components": {
        "minecraft:custom_data": "$snbt"
      }
    }
"@.TrimEnd()
    }

    $advText = @{}
    if ($config.PSObject.Properties['advancements']) {
        foreach ($prop in $config.advancements.PSObject.Properties) { $advText[$prop.Name] = $prop.Value }
    }

    $fullSetCriteria = @()
    $fullSetRequirements = @()
    foreach ($p in $plushies) {
        # Our loot tag, plus the owner name as stored by the mod. Mojang may return the canonical
        # name in different case to what's in the definition, so match the lowercase form too.
        # Build the SNBT first - nesting quotes inside "$( )" truncates the argument.
        $criteria = [ordered]@{ tagged = Get-PlushieCriterion ('{buffooncraft_plushie:"' + $p.Id + '"}') }
        $names = @($p.Owner, $p.Owner.ToLowerInvariant()) | Select-Object -Unique
        $n = 0
        foreach ($name in $names) {
            $key = if ($n -eq 0) { 'owner' } else { "owner_$n" }
            $criteria[$key] = Get-PlushieCriterion ('{PlushieOwner:{name:"' + $name + '"}}')
            $n++
        }

        $title = $p.Owner; $description = "Find $($p.Owner)'s plushie"
        if ($advText.ContainsKey($p.Id)) { $title = $advText[$p.Id].title; $description = $advText[$p.Id].description }
        else { Write-Log "No advancement text for $($p.Id) in config - using defaults" 'WARN' }

        $critJson = ($criteria.Keys | ForEach-Object { "    `"$_`": $($criteria[$_])" }) -join ",`n"
        $reqJson  = ($criteria.Keys | ForEach-Object { "      `"$_`"" }) -join ",`n"

        Write-JsonText (Join-Path $advDir "$($p.Id).json") @"
{
  "parent": "$hintId",
  "criteria": {
$critJson
  },
  "display": {
    "description": "$description",
    "hidden": true,
    "icon": $(Get-PlushieIcon $p.Owner),
    "title": "$title"
  },
  "requirements": [
    [
$reqJson
    ]
  ]
}
"@

        foreach ($k in $criteria.Keys) { $fullSetCriteria += "    `"$($p.Id)_$k`": $($criteria[$k])" }
        $fullSetRequirements += "    [`n" + (($criteria.Keys | ForEach-Object { "      `"$($p.Id)_$_`"" }) -join ",`n") + "`n    ]"
    }

    Write-JsonText (Join-Path $advDir 'full_set.json') @"
{
  "parent": "$hintId",
  "criteria": {
$($fullSetCriteria -join ",`n")
  },
  "display": {
    "description": "Collect all $($plushies.Count) plushies",
    "frame": "challenge",
    "icon": {
      "id": "plushie_friends:plushie"
    },
    "title": "Gotta Collect 'Em All"
  },
  "requirements": [
$($fullSetRequirements -join ",`n")
  ],
  "rewards": {
    "experience": 100,
    "function": "${namespace}:plushies/full_set"
  }
}
"@

    # Sanity-check every advancement parses, and that every custom_data SNBT is a closed compound
    # (valid JSON can still carry broken SNBT, which fails the whole datapack in-game).
    Get-ChildItem $advDir -Filter '*.json' | ForEach-Object {
        $raw = Get-Content $_.FullName -Raw
        $null = $raw | ConvertFrom-Json
        foreach ($m in [regex]::Matches($raw, '"minecraft:custom_data": "((?:[^"\\]|\\.)*)"')) {
            $snbt = $m.Groups[1].Value
            if (($snbt.Split('{').Count -ne $snbt.Split('}').Count) -or $snbt -notmatch ':\\"[^\\]+\\"\}') {
                throw "$($_.Name): malformed custom_data SNBT: $snbt"
            }
        }
    }
    Write-Log "Built $($plushies.Count + 3) advancement(s) in ${namespace}:plushies/"

    # --- Vanilla chest overrides ----------------------------------------------
    $outRoot = Join-Path $DatapackDir 'data\minecraft\loot_table'
    if (Test-Path $outRoot) { Remove-Item $outRoot -Recurse -Force }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead($jarPath)
    $prefix = 'data/minecraft/loot_table/'
    $written = 0

    try {
        # --- Sherd pool: every *_pottery_sherd item in this Minecraft version, equal weight ---
        $sherds = @($zip.Entries | Where-Object { $_.FullName -match '^assets/minecraft/items/([a-z_]+_pottery_sherd)\.json$' } |
            ForEach-Object { $Matches[1] } | Sort-Object -Unique)
        if ($sherds.Count -eq 0) { throw 'No pottery sherds found in the Minecraft jar.' }
        $sherdEntries = $sherds | ForEach-Object { "        {`n          `"type`": `"minecraft:item`",`n          `"name`": `"minecraft:$_`"`n        }" }
        Write-JsonText (Join-Path $DatapackDir "data\$namespace\loot_table\sherds\all_sherds.json") @"
{
  "type": "minecraft:generic",
  "pools": [
    {
      "entries": [
$($sherdEntries -join ",`n")
      ],
      "rolls": 1
    }
  ]
}
"@
        Write-Log "Built ${namespace}:sherds/all_sherds with $($sherds.Count) sherd(s)"

        # Each injection adds one "chance" roll into its pool. Config: plushies use the top-level
        # defaultChance/chanceOverrides, sherds use the "sherds" block.
        $sherdOverrides = @{}
        $sherdDefault = 0
        if ($config.PSObject.Properties['sherds']) {
            $sherdDefault = [double]$config.sherds.defaultChance
            foreach ($prop in $config.sherds.chanceOverrides.PSObject.Properties) { $sherdOverrides[$prop.Name] = [double]$prop.Value }
        }
        $injections = @(
            @{ Name = 'plushie'; Pool = $poolId;                      Default = [double]$config.defaultChance; Overrides = $chanceOverrides },
            @{ Name = 'sherd';   Pool = "${namespace}:sherds/all_sherds"; Default = $sherdDefault;                 Overrides = $sherdOverrides }
        )

        foreach ($entry in $zip.Entries | Where-Object { $_.FullName.StartsWith($prefix) -and $_.FullName.EndsWith('.json') }) {
            $tableId = $entry.FullName.Substring($prefix.Length) -replace '\.json$', ''
            if (-not (Test-AnyMatch $tableId $config.includeTables)) { continue }
            if (Test-AnyMatch $tableId $config.excludeTables) { continue }

            $pools = @(); $summary = @()
            foreach ($inj in $injections) {
                $chance = if ($inj.Overrides.ContainsKey($tableId)) { $inj.Overrides[$tableId] } else { $inj.Default }
                if ($chance -le 0) { continue }
                $chanceText = $chance.ToString([Globalization.CultureInfo]::InvariantCulture)
                $pools += @"
    {
      "condition": {
        "type": "minecraft:random_chance",
        "chance": $chanceText
      },
      "entries": [
        {
          "type": "minecraft:loot_table",
          "value": "$($inj.Pool)"
        }
      ],
      "rolls": 1
    },
"@.TrimEnd()
                $summary += ('{0} {1:P1}' -f $inj.Name, $chance)
            }
            if ($pools.Count -eq 0) { Write-Log "Skipping minecraft:$tableId (all chances 0)"; continue }

            $reader = New-Object IO.StreamReader($entry.Open())
            try { $vanilla = $reader.ReadToEnd() } finally { $reader.Dispose() }

            # Every vanilla table has exactly one "pools": [ - bail if that ever changes.
            $marker = '"pools": ['
            $hits = ([regex]::Matches($vanilla, [regex]::Escape($marker))).Count
            if ($hits -ne 1) { Write-Log "Skipping minecraft:${tableId} - expected 1 pools array, found $hits" 'WARN'; continue }

            $patched = $vanilla.Replace($marker, $marker + "`n" + ($pools -join "`n"))
            $null = $patched | ConvertFrom-Json   # throws if we produced invalid JSON

            Write-JsonText (Join-Path $outRoot ($tableId + '.json')) $patched
            $written++
            Write-Log ("minecraft:{0} <- {1}" -f $tableId, ($summary -join ', '))
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
