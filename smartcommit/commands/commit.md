---
description: Complete git workflow - commit changes, manage changelog, create releases automatically
shortcut: smartcommit.commit
---

I'll automatically execute the SmartCommit workflow by running the implementation script.

Running: python3 /home/thierry-lemaire/Documents/Devs/claude/marketplace/smartcommit/scripts/auto_commit.py "$@"

## Usage Examples

### Development Workflow
```bash
# Make your changes...
git add .

# SmartCommit handles everything:
/smartcommit.commit

# Output:
🔍 Analyzing staged changes...
📝 Detected 2 features, 1 improvement
💬 Generated: feat(auth): Add OAuth2 integration with GitHub providers
📋 CHANGELOG.md updated: 3 entries added to [Unreleased]
✅ Commit executed successfully
```

### Release Workflow (Automatic)
```bash
# When working tree is clean and [Unreleased] has entries:
/smartcommit.commit

# Output:
🚀 Release mode detected - working tree clean, [Unreleased] has entries
🔍 Analyzing [Unreleased] entries...
📝 Found 2 features, 1 fix, 0 breaking changes
🎯 Version bump: minor (1.2.1 → 1.3.0)
📋 Created version [1.3.0] - 2025-11-14
🏷️  Git tag created: v1.3.0
✅ Release ready! Run: git push origin v1.3.0
```

### Force Specific Actions
```bash
# Force commit mode (even with clean working tree)
/smartcommit.commit --force-commit

# Force release mode (create release even with staged changes)
/smartcommit.commit --force-release

# Preview what would happen
/smartcommit.commit --dry-run

# Use custom message
/smartcommit.commit "Add comprehensive user authentication system"
```

## Command Options

### Standard Usage
```bash
/smartcommit.commit
```
- **Auto-detects mode** based on git state and changelog content
- **Development mode** if staged changes exist
- **Release mode** if clean tree + [Unreleased] entries
- **Setup mode** if no CHANGELOG.md exists

### Mode Control
```bash
/smartcommit.commit --mode=commit      # Force commit mode
/smartcommit.commit --mode=release     # Force release mode
/smartcommit.commit --mode=setup       # Force setup mode
```

### Preview Mode
```bash
/smartcommit.commit --dry-run
```
- Analyzes without making changes
- Shows what would be done
- Safe for experimentation

### Version Control (Release Mode)
```bash
/smartcommit.commit --version=2.0.0    # Force specific version
/smartcommit.commit --type=major       # Force major version bump
/smartcommit.commit --type=minor       # Force minor version bump
/smartcommit.commit --type=patch       # Force patch version bump
```

### Custom Messages
```bash
/smartcommit.commit "Custom commit message"
```
- Uses your message instead of generated one
- Still analyzes changes for changelog entries
- Maintains all other automatic behavior

## Smart Mode Detection Logic

### Development Mode Conditions
```bash
# Any of these trigger Development Mode:
✅ Staged changes exist
✅ --force-commit flag used
✅ --mode=commit specified
✅ No CHANGELOG.md (triggers Setup Mode first)
```

### Release Mode Conditions
```bash
# All of these required for Release Mode:
✅ Working tree clean (no staged changes)
✅ CHANGELOG.md exists
✅ [Unreleased] section has entries
✅ No --force-commit flag
```

### Setup Mode Conditions
```bash
# Triggers when:
✅ No CHANGELOG.md in project root
✅ Any mode selected (will setup first, then execute)
```

## Automatic Version Management

### Semantic Versioning Logic
```bash
# Breaking Changes → Major Version
### 💥 Breaking Changes
- Remove deprecated API endpoints
# Output: v2.0.0 (1.3.0 → 2.0.0)

# Features → Minor Version
### 🆕 Added / ### 🔄 Changed
- User authentication system
- Performance optimizations
# Output: v1.4.0 (1.3.0 → 1.4.0)

# Fixes → Patch Version
### ✅ Fixed / ### 📚 Documentation
- Login validation issues
- Documentation updates
# Output: v1.3.1 (1.3.0 → 1.3.1)
```

### Changelog Format (Keep a Changelog v1.1.0)
```markdown
# 📋 Changelog

## [Unreleased]

### 🆕 Added
- User authentication system with OAuth2 support

### ✅ Fixed
- Login validation issues on mobile devices

## [1.3.0] - 2025-11-14

### 🆕 Added
- User authentication system with OAuth2 support

### ✅ Fixed
- Login validation issues on mobile devices
```

## Complete Workflow Examples

### New Feature Development
```bash
# 1. Implement feature
# ... (development work)

# 2. Stage and commit
git add .
/smartcommit.commit
# Output: "feat(auth): Add OAuth2 integration with GitHub providers"
# Result: Changes added to [Unreleased] section

# 3. Later, when ready to release:
/smartcommit.commit
# Output: "✅ Version [1.4.0] - 2025-11-14 created, git tag v1.4.0 created"
```

### Bug Fix Process
```bash
# 1. Fix bug and commit
git add .
/smartcommit.commit
# Output: "fix(ui): Resolve responsive layout issues on mobile devices"
# Result: Fix added to [Unreleased] section

# 2. Create patch release
/smartcommit.commit
# Output: "✅ Version [1.3.1] - 2025-11-14 created, git tag v1.3.1 created"
```

### Major Release Process
```bash
# 1. Make breaking changes
git add .
/smartcommit.commit "feat!: Refactor authentication API (breaking change)"
# Result: Breaking change added to [Unreleased] section

# 2. Create major release
/smartcommit.commit
# Output: "✅ Version [2.0.0] - 2025-11-14 created, git tag v2.0.0 created"
```

## Error Handling

### No Changes to Process
```bash
❌ No staged changes found and [Unreleased] section is empty
💡 Make changes first, or use:
   git add <files>
   /smartcommit.commit

📋 Nothing to commit or release
```

### Mixed State (Staged + [Unreleased])
```bash
⚠️  Both staged changes AND [Unreleased] entries exist
💡 Choose action:

# Commit first, then release:
/smartcommit.commit    # Commits staged changes
/smartcommit.commit    # Creates release

# Or force release immediately:
/smartcommit.commit --force-release
```

### Invalid Version Format
```bash
⚠️  Invalid version format detected: "v1.3.0"
💡 Correcting to standard format: "1.3.0"

📋 Semantic versioning: X.Y.Z where X=major, Y=minor, Z=patch
```

## Git Integration

### Automatic Tagging
```bash
# Release mode automatically creates:
git tag v1.3.0
git push origin v1.3.0  # You run this manually

# List all version tags:
git tag --list "v*"
```

### Version History
```bash
# Show release history:
git tag --sort=-version:refname

# Show commits since last release:
git log v1.2.0..HEAD --oneline
```

## Configuration

### Zero Configuration Required
SmartCommit works out of the box! Just run `/smartcommit.commit`.

### Optional Configuration (smartcommit.json)
```json
{
  "commit": {
    "autoRelease": true,
    "createTags": true,
    "pushInstructions": true
  },
  "versioning": {
    "scheme": "semver",
    "prefix": "v",
    "dateFormat": "YYYY-MM-DD"
  },
  "changelog": {
    "file": "CHANGELOG.md",
    "format": "keepachangelog"
  }
}
```

## Best Practices

### Before Running SmartCommit
- **Review changes** - Ensure staged changes are correct
- **Working tree** - Usually commit changes before releasing
- **[Unreleased] section** - Check it looks accurate for release

### Team Collaboration
- **Conventional commits** - Let SmartCommit generate proper format
- **Semantic versioning** - Trust automatic version detection
- **Release coordination** - Use `--dry-run` to preview releases

### Git Workflow Integration
- **Feature branches** - SmartCommit works on any branch
- **Main branch releases** - Releases typically from main/master
- **Tag management** - SmartCommit creates tags, you push them

## Troubleshooting

### Common Issues

#### Mixed State Confusion
```bash
⚠️  Both staged changes and [Unreleased] entries exist
💡 SmartCommit doesn't know what to do first

# Solution: Choose your priority:
/smartcommit.commit --force-commit  # Commit first, ignore [Unreleased]
/smartcommit.commit --force-release # Release first, ignore staged changes
```

#### Empty [Unreleased] Section
```bash
❌ [Unreleased] section has no entries
💡 Add entries with commits first, or:
   /smartcommit.commit --mode=setup  # Fresh start
```

#### Version Conflicts
```bash
❌ Git tag v1.3.0 already exists
💡 Force different version:
   /smartcommit.commit --version=1.3.1
```

### Getting Help
```bash
# Preview any action safely:
/smartcommit.commit --dry-run

# Show available options:
/smartcommit.commit --help

# Check current state:
git status
cat CHANGELOG.md | grep -A 10 "## \[Unreleased\]"
```

---

**SmartCommit - Complete git workflow in one command.** Just run `/smartcommit.commit` and let it handle everything intelligently.