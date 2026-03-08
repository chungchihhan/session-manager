---
name: delete-session
description: Delete a Claude Code session. This permanently removes the session transcript.
user-invocable: true
argument-hint: "<session-id-or-name>"
---

# Delete Session

**WARNING**: This permanently deletes session data. This action cannot be undone.

## Task

Delete the session: $ARGUMENTS

## Steps

1. First, confirm with the user that they want to delete this session
2. Run the deletion command:

```bash
${CLAUDE_PLUGIN_ROOT}/bin/super-resume delete "$ARGUMENTS"
```

3. Verify the session was deleted

## Safety Notes

- Always confirm deletion with the user before proceeding
- Session transcripts are stored as JSONL files in `~/.claude/projects/`
- Deletion also removes any associated metadata (pins, tags)
- There is no undo - deleted sessions cannot be recovered
