#!/usr/bin/env bash
# PreToolUse hook: runs before git commit
# Receives hook event JSON on stdin.

cmd=$(jq -r '.tool_input.command')

if ! echo "$cmd" | grep -q 'git commit'; then
  exit 0
fi

echo "--- ruff format ---"
if ! uvx ruff format; then
  echo "ruff format failed" >&2
  exit 2
fi

echo "--- ruff check --fix ---"
if ! uvx ruff check --fix; then
  echo "ruff check found unfixable errors" >&2
  exit 2
fi

echo "--- pyright ---"
if ! uv run pyright; then
  echo "pyright found type errors" >&2
  exit 2
fi
