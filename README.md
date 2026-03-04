# Claude Code Session Manager

A TUI plugin for managing Claude Code sessions - pin, delete, tag, and preview sessions.

![Demo](https://img.shields.io/badge/TUI-bubbletea-blue)

## Features

- **📋 List sessions** with metadata (name, date, directory, message count)
- **📌 Pin/unpin sessions** - pinned sessions appear first
- **🗑️ Delete sessions** with confirmation
- **🏷️ Tag sessions** for organization
- **🔍 Filter sessions** by name, ID, directory, or tag
- **👁️ Preview panel** showing session details

## Prerequisites

- [Go 1.21+](https://go.dev/dl/)
- Claude Code CLI

## Installation

```bash
# Clone the repository
git clone https://github.com/harrychung/session-manager.git
cd session-manager

# Build the binary
make build

# Or manually:
go mod tidy
go build -o bin/session-manager ./cmd/session-manager
```

## Usage with Claude Code

### Option 1: Use as a plugin

```bash
# Add as a plugin directory
claude --plugin-dir ~/Developer/Personal/session-manager
```

Then use the skills:
- `/manage-sessions` - Launch the TUI
- `/pin-session [id]` - Pin a session
- `/delete-session <id>` - Delete a session
- `/add-tag <id> <tag>` - Add a tag

### Option 2: Use directly

```bash
# Launch TUI
./bin/session-manager

# CLI commands
./bin/session-manager list
./bin/session-manager pin <session-id>
./bin/session-manager unpin <session-id>
./bin/session-manager delete <session-id>
./bin/session-manager tag <session-id> <tag>
```

## TUI Keyboard Shortcuts

| Key | Action |
|-----|--------|
| ↑/k | Move up |
| ↓/j | Move down |
| PgUp/Ctrl+u | Page up |
| PgDn/Ctrl+d | Page down |
| p | Pin/unpin session |
| d | Delete session |
| t | Add tag |
| / | Filter sessions |
| Tab | Toggle preview panel |
| Enter | Show resume command |
| ? | Toggle full help |
| q | Quit |

## Data Storage

- **Sessions**: `~/.claude/projects/**/*.jsonl`
- **Metadata** (pins, tags): `~/.claude/session-metadata.json`

## Development

```bash
# Format code
make fmt

# Run tests
make test

# Build and run
make run
```

## License

MIT
