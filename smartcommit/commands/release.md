---
description: Create version releases from [Unreleased] changelog entries with semantic versioning
shortcut: smartcommit.release
---

# Smart Release Command

Convert [Unreleased] changelog entries into versioned releases with automatic semantic versioning.

## What to do:

1. **Analyze [Unreleased] section**:
   - Check if CHANGELOG.md exists in project root
   - Parse [Unreleased] section for entries
   - Categorize changes by type (features, fixes, breaking changes)

2. **Determine semantic version bump**:
   - **Major bump (X.0.0)**: Breaking changes detected
   - **Minor bump (X.Y.0)**: Features or improvements detected
   - **Patch bump (X.Y.Z)**: Only fixes and documentation updates
   - **No bump (X.Y.Z)**: Empty [Unreleased] section

3. **Calculate next version**:
   - Read latest version from changelog
   - Apply semantic version bump based on changes
   - Format: [X.Y.Z] - YYYY-MM-DD

4. **Execute version release**:
   - Move [Unreleased] entries to new version section
   - Add current date to version
   - Clear [Unreleased] section
   - Keep [Unreleased] section header for future entries
   - Stage changelog changes
   - Create git tag with version number
   - Provide git push instructions

5. **Handle edge cases**:
   - Empty [Unreleased] section: Warn user, no release created
   - No CHANGELOG.md: Error message for SmartCommit usage
   - Invalid version format: Warn and fix format

## Usage Examples

### Automatic Version Detection
```bash
# Auto-detect version bump based on [Unreleased] content
/smartcommit.release

# Output:
🔍 Analyzing [Unreleased] entries...
📝 Found 2 features, 1 fix, 0 breaking changes
🎯 Version bump: minor (1.2.1 → 1.3.0)
📋 Created version [1.3.0] - 2025-11-14
🏷️  Git tag created: v1.3.0
✅ Release ready! Run: git push origin v1.3.0
```

### Specific Version
```bash
# Force specific version number
/smartcommit.release --version=2.0.0

# Output:
🔍 Analyzing [Unreleased] entries...
📝 Found 1 breaking change, 3 features
🎯 Using specified version: 2.0.0
📋 Created version [2.0.0] - 2025-11-14
🏷️  Git tag created: v2.0.0
✅ Breaking change released! Run: git push origin v2.0.0
```

### Dry Run Mode
```bash
# Preview release without executing
/smartcommit.release --dry-run

# Output:
🔍 Analyzing [Unreleased] entries...
📝 Found 1 fix, 1 documentation update
🎯 Version bump: patch (1.3.0 → 1.3.1)
📋 Would create version [1.3.1] - 2025-11-14
🏷️  Would create git tag: v1.3.1
🚀 Dry run - no changes made
💡 Use without --dry-run to execute release
```

### Force Release Type
```bash
# Force specific version bump type
/smartcommit.release --type=major

# Output:
🔍 Analyzing [Unreleased] entries...
📝 Found 2 improvements, 1 fix
🎯 Forced major bump: 1.3.0 → 2.0.0
📋 Created version [2.0.0] - 2025-11-14
🏷️  Git tag created: v2.0.0
⚠️  Major version forced (no breaking changes detected)
```

## Version Detection Logic

### Semantic Versioning Rules
```bash
# Major Version (Breaking Changes)
BREAKING CHANGE: New version incompatible with previous versions
Examples: API removal, database schema changes, config format changes
Version bump: 1.3.0 → 2.0.0

# Minor Version (Features)
New features, improvements, enhancements that are backward compatible
Examples: New functionality, performance improvements, refactoring
Version bump: 1.3.0 → 1.4.0

# Patch Version (Fixes)
Bug fixes, documentation updates, minor improvements
Examples: Error corrections, typo fixes, doc updates
Version bump: 1.3.0 → 1.3.1
```

### Change Type Detection
```markdown
### 🆕 Added / ### 🔄 Changed → Minor Version
- New features, functionality, capabilities
- Code improvements, enhancements, refactoring
- Performance optimizations
- New integrations, APIs

### ✅ Fixed / ### 📚 Documentation → Patch Version
- Bug fixes, error corrections
- Documentation updates, README changes
- Minor tweaks, improvements
- Dependency updates

### 💥 Breaking Changes → Major Version
- Explicit breaking changes section
- API removal/incompatible changes
- Database schema changes
- Configuration format changes
```

## Error Handling

### Empty [Unreleased] Section
```bash
❌ No [Unreleased] entries found
💡 Make changes and commit them first with:
   /smartcommit.commit

📋 Current [Unreleased] section is empty
```

### No CHANGELOG.md
```bash
❌ CHANGELOG.md not found in project root
💡 Create initial changelog with:
   /smartcommit.commit (first commit will create it)

📋 SmartCommit requires CHANGELOG.md for version management
```

### Invalid Version Format
```bash
⚠️  Invalid version format detected: "v1.3.0"
💡 Correcting to standard format: "1.3.0"

📋 SemVer format: X.Y.Z where X=major, Y=minor, Z=patch
```

## Git Integration

### Automatic Tagging
```bash
# Git tag created automatically
git tag v1.3.0

# Push tag to remote (manual step)
git push origin v1.3.0

# List all version tags
git tag --list "v*"
```

### Version History
```bash
# Show release history
git tag --sort=-version:refname

# Show commits since last release
git log v1.2.0..HEAD --oneline

# Show changelog between versions
git show v1.3.0:CHANGELOG.md
```

## Configuration

### Release Configuration (smartcommit.json)
```json
{
  "release": {
    "autoTag": true,
    "pushInstructions": true,
    "defaultType": "auto",
    "dateFormat": "YYYY-MM-DD"
  },
  "versioning": {
    "scheme": "semver",
    "prefix": "v",
    "allowPrerelease": false
  }
}
```

### Custom Version Patterns
```json
{
  "release": {
    "versionPattern": "vX.Y.Z",
    "dateFormat": "YYYY-MM-DD HH:mm"
  }
}
```

## Best Practices

### Before Releasing
1. **Ensure all changes are committed** - No pending changes
2. **Review [Unreleased] section** - Verify entries are accurate
3. **Check version appropriateness** - Ensure bump type makes sense
4. **Run tests** - Verify release readiness
5. **Update documentation** - Ensure docs reflect changes

### After Releasing
1. **Push git tag** - Share release with team/users
2. **Create GitHub Release** - Add release notes if applicable
3. **Notify team** - Announce new version
4. **Update integrations** - Deploy new version if needed
5. **Monitor** - Watch for any post-release issues

### Team Collaboration
- **Coordinate releases** - Avoid conflicting releases
- **Use semantic versioning** - Maintain compatibility promises
- **Document breaking changes** - Clear migration paths
- **Test releases** - Verify release process works

## Integration with CI/CD

### Automated Releases
```yaml
# GitHub Actions example
- name: Release with SmartCommit
  run: |
    if [ "$EVENT_TYPE" = "push" ] && [ "$BRANCH" = "main" ]; then
      /smartcommit.release --auto
      git push origin --tags
    fi
```

### Release Validation
```yaml
# Validate before release
- name: Check for unreleased changes
  run: /smartcommit.release --dry-run

- name: Run release if changes exist
  run: /smartcommit.release
  if: steps.check.outputs.has_changes == 'true'
```

Transform your development workflow with automatic version management - making releases consistent, semantic versioning effortless, and release history meaningful.