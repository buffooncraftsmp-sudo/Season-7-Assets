# Chat emotes (Emojiful)

Emojiful doesn't read emote images out of the resource/datapack the way paintings do.
Each emote is a datapack "recipe" that points Emojiful at a hosted image URL, which it
downloads at runtime.

## Adding a new emote

1. Drop the PNG/GIF in `chat_emotes/images/` (name it after the emote, e.g. `kappa.png`).
2. Commit and push it to `main` - the recipe URL below only works once the file exists
   on the branch it points at.
3. Add `datapack/data/emojiful/recipes/<name>.json` (namespace and folder name match
   what Emojiful's own Discord bot generates - `data/emojiful/recipes/`, not the pack's
   own namespace):

```json
{
  "category": "Buffooncraft",
  "name": "<name>",
  "url": "https://raw.githubusercontent.com/buffooncraftsmp-sudo/Season-7-Assets/main/chat_emotes/images/<name>.png",
  "type": "emojiful:emoji_recipe"
}
```

Use category `"Buffooncraft"` for person-specific emotes, `"Generic"` for everything else.

## Gotcha

The URL is pinned to a branch (`main` above). If it points at a feature branch instead
and that branch gets deleted after merging, every emote using it breaks. Point recipe
URLs at `main` (or a tag/commit SHA) once the image has landed there, not at a
short-lived working branch.
