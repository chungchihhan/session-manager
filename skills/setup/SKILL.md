---
name: setup
description: Configure Super Resume settings (terminal preference, build binary if needed)
user-invocable: true
argument-hint: ""
---

# Setup Super Resume

Configure Super Resume and ensure the binary is built.

## Steps

### Step 1: Ensure the binary exists

Check if the binary exists:

```bash
ls "${CLAUDE_PLUGIN_ROOT}/bin/super-resume" 2>/dev/null && echo "exists" || echo "missing"
```

If missing, build it:

```bash
cd "${CLAUDE_PLUGIN_ROOT}" && go build -o bin/super-resume ./cmd/super-resume
```

If `go` is not installed, tell the user:
> The `super-resume` binary needs to be built. Please install Go from https://go.dev/dl/ then run `/setup` again.

If build succeeds, confirm: "Binary built successfully."

### Step 2: Check current terminal configuration

```bash
"${CLAUDE_PLUGIN_ROOT}/bin/super-resume" config terminal
```

### Step 3: Configure terminal if not set

If not configured, ask the user which terminal they use:

| Option | Terminal |
|--------|----------|
| 1 | Warp |
| 2 | iTerm2 |
| 3 | Terminal.app (macOS default) |
| 4 | Kitty |
| 5 | Alacritty |

Once user selects, run:

```bash
"${CLAUDE_PLUGIN_ROOT}/bin/super-resume" config terminal <terminal-name>
```

Where `<terminal-name>` is one of: `warp`, `iterm`, `terminal`, `kitty`, `alacritty`

### Step 4: Confirm setup complete

Tell the user setup is complete and they can now use:
- `/list-session` - List sessions
- `/go <n>` - Resume a session (opens new tab in configured terminal)

## Notes for Warp users

Enable Warp in System Settings → Privacy & Security → Accessibility so `/go` can type commands in the new tab.
