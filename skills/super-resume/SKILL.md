---
name: super-resume
description: Show instructions for the Super Resume TUI (run from terminal)
user-invocable: true
argument-hint: ""
---

# Super Resume TUI

**The TUI must be run from your terminal, not inside Claude Code.**

## First-Time Setup (Marketplace Install)

If you installed via the Claude Code marketplace, run `/setup` first to download the binary and configure your terminal:

```
/setup
```

This only needs to be done once.

## How to Use

```bash
super-resume
```

## Features

- Browse sessions - View all or filter by current directory
- Resume directly - Press Enter to jump into a session
- Pin sessions - Pinned sessions appear first
- Tag sessions - Add, edit, and remove tags
- Filter sessions - Search by name, ID, directory, or tag
- Preview messages - Navigate through conversation history

## Keyboard Shortcuts

| Key         | Action                       |
| ----------- | ---------------------------- |
| `↑/k` `↓/j` | Navigate                     |
| `Enter`     | Resume session               |
| `→/l`       | Preview session              |
| `A`         | Toggle all/current directory |
| `S`         | Show/hide agent sessions     |
| `P`         | Pin/unpin                    |
| `T`         | Add tag                      |
| `U`         | Manage tags                  |
| `D`         | Delete                       |
| `/`         | Filter                       |
| `Q`         | Quit                         |

## Quick Commands (inside Claude Code)

Type `/help` to see all available commands.
