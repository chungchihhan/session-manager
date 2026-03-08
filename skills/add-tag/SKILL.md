---
name: add-tag
description: Add a tag to a Claude Code session for organization
user-invocable: true
argument-hint: "<session-id> <tag>"
---

# Add Tag to Session

Add a tag to a session to help organize and filter sessions.

## Task

Add tag to session: $ARGUMENTS

## Steps

1. Parse the arguments to extract session ID and tag name
2. Run the tag command:

```bash
${CLAUDE_PLUGIN_ROOT}/bin/super-resume tag $ARGUMENTS
```

3. Confirm the tag was added

## Usage Examples

- `/add-tag abc123 work` - Add "work" tag to session abc123
- `/add-tag my-session important` - Add "important" tag

## Notes

- Tags are stored in `~/.claude/session-metadata.json`
- Sessions can have multiple tags
- Use `/manage-sessions` to filter by tag (type the tag name in the filter)
