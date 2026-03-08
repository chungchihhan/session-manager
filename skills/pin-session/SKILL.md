---
name: pin-session
description: Pin a Claude Code session for quick access. Pinned sessions appear first in the session list.
user-invocable: true
argument-hint: "[session-id-or-name]"
---

# Pin Session

Pin a session to mark it as important or frequently accessed. Pinned sessions appear at the top of the session list.

## Task

Pin the session: $ARGUMENTS

If no session is specified, pin the current session using CLAUDE_SESSION_ID.

## Steps

1. Run the pin command:

```bash
${CLAUDE_PLUGIN_ROOT}/bin/super-resume pin "$ARGUMENTS"
```

2. Confirm the session was pinned successfully.

## Notes

- Pinned sessions are stored in `~/.claude/session-metadata.json`
- Use `/manage-sessions` to view all pinned sessions
- Use `/unpin-session` to remove the pin
