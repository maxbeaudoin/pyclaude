# pyclaude

A FastAPI app with a full local and CI quality toolchain.

## Quick Start

```bash
uv run fastapi dev src/main.py
```

Visit http://localhost:8000

## Development

```bash
# Lint and auto-fix
uvx ruff check --fix

# Format
uvx ruff format

# Type check
uv run pyright

# Run tests
uv run pytest
```

## Tooling

- **Formatter/Linter:** [Ruff](https://docs.astral.sh/ruff/)
- **Type checker:** [Pyright](https://github.com/microsoft/pyright)
- **Test runner:** [pytest](https://pytest.org)
- **Package manager:** [uv](https://docs.astral.sh/uv/)

## Hooks

Claude Code hooks enforce quality automatically:

- **On file edit:** `ruff format` runs on every `.py` file
- **On `git commit`:** `ruff format`, `ruff check --fix`, and `pyright` must pass
- **On `git push`:** `pytest` must pass

## CI

GitHub Actions runs on every pull request: lint, format check, type check, and tests.
