#!/usr/bin/env bash
# PostToolUse hook: runs after Edit or Write
# Receives hook event JSON on stdin.

file=$(jq -r '.tool_input.file_path')

[[ "$file" == *.py ]] || exit 0

echo "--- ruff format ---"
uvx ruff format "$file"
