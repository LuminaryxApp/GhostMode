#!/bin/bash
set -euo pipefail

# Read input from stdin
input=$(cat)

# Extract command from tool input
command=$(echo "$input" | jq -r '.tool_input.command // ""')

# Check if this is a git commit command
if [[ "$command" != *"git commit"* ]]; then
    # Not a git commit, allow it
    echo '{"continue": true}'
    exit 0
fi

# Patterns to detect and remove
AI_PATTERNS=(
    "🤖 Generated with"
    "Generated with Claude"
    "Generated with \[Claude"
    "Co-Authored-By: Claude"
    "Co-authored-by: Claude"
    "claude-opus"
    "claude-sonnet"
    "noreply@anthropic.com"
)

# Check if command contains any AI patterns
needs_modification=false
modified_command="$command"

for pattern in "${AI_PATTERNS[@]}"; do
    if [[ "$command" == *"$pattern"* ]]; then
        needs_modification=true
        break
    fi
done

if [ "$needs_modification" = true ]; then
    # Block the commit and provide guidance
    echo '{"continue": true, "systemMessage": "GHOST MODE: Detected AI attribution in commit. Remove the following before committing: 🤖 Generated with Claude Code footer, Co-Authored-By: Claude header, any @anthropic.com email references. Write a clean commit message without AI markers."}'
    exit 0
fi

# No AI patterns found, allow the command
echo '{"continue": true}'
exit 0
