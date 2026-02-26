# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the dev server
uv run fastapi dev src/main.py

# Lint and auto-fix
uvx ruff check --fix

# Format
uvx ruff format

# Run tests
uv run pytest
```

## Architecture

Single-file FastAPI app (`main.py`). Dependencies are managed with `uv` — use `uv add <package>` to add dependencies, which updates `pyproject.toml` and `uv.lock`.

## Principles

- **KISS** — prefer the simplest solution that works
- **YAGNI** — don't add functionality until it's needed
- **DRY** — avoid duplication; extract only when a pattern is stable and used 3+ times
- **SOLID** — single responsibility, open/closed, Liskov substitution, interface segregation, dependency inversion
- **POLA** — code should behave exactly as a reader would expect; avoid surprising side effects

## Code Style

- Type-annotate all function signatures; body annotations only where they aid clarity
- Use `snake_case` for variables/functions, `PascalCase` for classes, `UPPER_SNAKE` for module-level constants
- Imports: stdlib → third-party → local, each group alphabetically sorted (Ruff enforces this)
- Keep functions short and focused; if a function needs a comment to explain what it does, consider splitting it

## Testing

- Tests live in `tests/`, mirroring the `src/` layout
- Name test files `test_<module>.py`, test functions `test_<behaviour>`
- Prefer narrow, focused tests; one assertion per logical concern
- Use `pytest` fixtures for shared setup; avoid global state

## Git & PR Workflow

- Branch naming: `feat/<slug>`, `fix/<slug>`, `chore/<slug>`
- Commit messages: imperative mood, present tense (e.g. `Add user endpoint`)
- Keep commits atomic; squash fixups before merging
- PRs require CI to pass; no force-pushes to `main`

## Error Handling

- Raise exceptions at the boundary where the error is detected; don't swallow errors silently
- Use specific exception types over bare `Exception`
- Log errors with context (what was attempted, relevant IDs) before re-raising or returning an HTTP error
- Return HTTP 4xx for client errors, 5xx for server faults; never expose internal tracebacks to the client