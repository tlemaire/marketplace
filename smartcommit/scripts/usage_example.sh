#!/bin/bash
# SmartCommit Python Script Usage Examples

echo "🚀 SmartCommit Python Script - Usage Examples"
echo "============================================"
echo

# Show script location
SCRIPT_PATH="$(dirname "$0")/auto_commit.py"
echo "📍 Script location: $SCRIPT_PATH"
echo

# Example 1: Show help
echo "📖 Example 1: Show help"
echo "python3 $SCRIPT_PATH --help"
echo
python3 "$SCRIPT_PATH" --help
echo
echo "---"
echo

# Example 2: Dry run with staged changes (if any)
echo "🔍 Example 2: Dry run analysis"
echo "python3 $SCRIPT_PATH --dry-run"
echo
python3 "$SCRIPT_PATH" --dry-run
echo
echo "---"
echo

# Example 3: Show current repository state
echo "📊 Current repository state:"
echo "git status:"
git status --porcelain
echo

if [ -f "CHANGELOG.md" ]; then
    echo "CHANGELOG.md: exists"
    echo "Unreleased entries:"
    grep -A 5 "## \[Unreleased\]" CHANGELOG.md 2>/dev/null || echo "  No [Unreleased] section found"
else
    echo "CHANGELOG.md: missing"
fi
echo

echo "💡 Usage Tips:"
echo "- Use --dry-run to preview actions before executing"
echo "- Stage changes with 'git add .' before running commit mode"
echo "- Use custom messages with: python3 $SCRIPT_PATH \"your message here\""
echo "- Force release mode with: python3 $SCRIPT_PATH --force-release"
echo "- Force specific version with: python3 $SCRIPT_PATH --version=2.0.0"
echo

echo "✅ SmartCommit Python script is ready to use!"