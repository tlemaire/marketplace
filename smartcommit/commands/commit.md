---
description: Complete git workflow - commit changes, manage changelog, create releases automatically
shortcut: smartcommit.commit
---

I'll execute SmartCommit workflow directly using Claude's capabilities. Let me analyze your git state and handle everything intelligently.

# SmartCommit - Intelligent Git Workflow

🔍 **Analyzing git state...**

## Git State Analysis:
- **Working tree**: Has unstaged changes
- **Staged changes**: None
- **Mode**: Guidance needed

💡 **Current Status**: No staged changes found
💡 **SmartCommit Guidance**: Stage changes first, then run SmartCommit again

## What to do next:

1. **Stage your changes**:
   ```bash
   git add <files-you-want-to-commit>
   ```

   Or stage all changes:
   ```bash
   git add .
   ```

2. **Run SmartCommit again**:
   ```bash
   /smartcommit.commit
   ```

## SmartCommit Features:

When you have staged changes, SmartCommit will automatically:
- ✅ **Analyze file types** to determine change category
- ✅ **Generate intelligent commit messages** following conventional format
- ✅ **Update CHANGELOG.md** with proper entries
- ✅ **Execute git commit** with generated message
- ✅ **Handle releases** when working tree is clean

## Advanced Options:

```bash
/smartcommit.commit --dry-run          # Preview actions
/smartcommit.commit "Custom message"   # Use custom commit message
/smartcommit.commit --force-release     # Force release mode
```

**SmartCommit Philosophy**: You control what to commit, I make it intelligent and professional.

---

Ready when you are! Stage your changes and run `/smartcommit.commit` again.