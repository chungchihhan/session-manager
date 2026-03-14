## What's New

### Slash Commands — Manage Sessions Inside Claude Code

You can now manage sessions without leaving Claude Code.

**First, configure your terminal (one-time setup):**

```bash
super-resume config terminal warp    # or: iterm, terminal, kitty, alacritty
```

> Warp users: enable Warp in System Settings → Privacy & Security → Accessibility.

Then use slash commands:

| Command | Description |
|---------|-------------|
| `/list-session` | List sessions in current directory |
| `/list-session -a -10` | List 10 sessions from all directories |
| `/list-pinned` | List pinned sessions |
| `/list-tagged <tag>` | List sessions with a tag |
| `/go <n>` | Resume session by number — opens a new tab in your terminal |
| `/pin`, `/unpin` | Pin or unpin a session |
| `/tag <tag>`, `/untag <tag>` | Add or remove tags |
| `/setup` | Configure your terminal preference |
| `/help` | Show all commands |

### Improved Session List

- Cleaner table with box-drawing characters
- Longer session names (100 chars)
- Shows time alongside date
- Filters out agent and warmup sessions automatically
- Highlights your current session with ← current

### List Filters

```bash
super-resume list -a -10 --pinned --json
super-resume list --tagged work
```

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/chungchihhan/super-resume/main/install.sh | bash
```
