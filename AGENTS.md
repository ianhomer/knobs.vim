# AGENTS.md

Guidance for AI assistants working on knobs.vim.

## Project Overview

Feature flag system for Vim/Neovim. Enables conditional plugin loading and configuration based on "levels" - plugins configured at or below the current level are enabled.

## Commands

### Testing

```bash
make test          # Run all tests (test-nvim, test-lua, test-vader)
make test-nvim     # Run Neovim tests with Plenary
make test-lua      # Run Lua unit tests with Busted
make test-vader    # Run VimScript tests with Vader
```

### Development

```bash
make start         # Start Neovim with test config
make start-nvim    # Start Neovim with test config
make start-vim     # Start Vim with test config
make container     # Spin up local container for isolated testing
```

### Cleanup

```bash
make clean         # Remove test installations and build artifacts
```

## Code Style

- Lua: 4-space indentation
- No code comments unless explicitly requested
- Follow existing patterns in the codebase

## Key Files

- `lua/knobs.lua` - Main Lua module for Neovim/packer integration
- `autoload/knobs.vim` - VimScript autoload functions
- `autoload/knobs/core.vim` - Core knob logic
- `plugin/knobs.vim` - Plugin initialization
- `test/` - Test files (Vader, Lua specs)
