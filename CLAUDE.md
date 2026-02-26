# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the dev server
uv run fastapi dev main.py

# Lint and auto-fix
uvx ruff check --fix

# Format
uvx ruff format

# Run tests
uv run pytest
```

## Architecture

Single-file FastAPI app (`main.py`). Dependencies are managed with `uv` — use `uv add <package>` to add dependencies, which updates `pyproject.toml` and `uv.lock`.