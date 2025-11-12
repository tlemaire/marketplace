---
description: Generate and manage changelog entries automatically
shortcut: smartcommit.changelog
---

# Smart Changelog Command

Generate, manage, and format changelog entries automatically based on git history and project conventions.

## What to do:

1. **Parse git commit history**:
   - Analyze recent commits since last changelog entry
   - Categorize commits by type (feat, improve, fix, docs, etc.)
   - Group related changes and identify patterns
   - Extract version information from commit messages

2. **Detect changelog format**:
   - Identify existing changelog file location
   - Parse current format and structure
   - Detect version numbering scheme
   - Maintain existing styling conventions

3. **Generate changelog entries**:
   - Create structured entries based on commit analysis
   - Format according to Keep a Changelog standard
   - Include version information and release dates
   - Group changes by type with clear descriptions

4. **Update changelog file**:
   - Insert new entries at appropriate location
   - Maintain chronological order
   - Preserve existing content and formatting
   - Create new version section when needed

5. **Version management**:
   - Detect semantic versioning patterns
   - Suggest appropriate version bump
   - Update version in configuration files
   - Handle pre-release and build metadata

## Changelog Formats:

### Keep a Changelog (Recommended)
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New feature descriptions

### Changed
- Breaking changes and modifications

### Deprecated
- Features marked for future removal

### Removed
- Removed features

### Fixed
- Bug fixes and resolutions

### Security
- Security improvements and fixes

## [1.2.0] - 2024-01-15

### Added
- Feature implementations
```

### Custom Format Support
- **Markdown**: Common changelog formatting
- **RST**: Python documentation standard
- **HTML**: Web-based changelogs
- **JSON**: Machine-readable format
- **YAML**: Structured data format

## Usage Examples:

### Generate New Entry
```bash
# Create new changelog entry from recent commits
/smartcommit.changelog

# Generate for specific version
/smartcommit.changelog --version=1.2.0

# Include commits since specific date
/smartcommit.changelog --since=2024-01-01
```

### Update Existing Changelog
```bash
# Update current unreleased section
/smartcommit.changelog --update-unreleased

# Create new release section
/smartcommit.changelog --release

# Generate from specific commit range
/smartcommit.changelog --from=abc123 --to=def456
```

### Format and Style Options
```bash
# Use custom template
/smartcommit.changelog --template=custom-template.md

# Group by component/module
/smartcommit.changelog --group-by=component

# Include commit hashes
/smartcommit.changelog --include-hashes

# Add author information
/smartcommit.changelog --include-authors
```

## Configuration:

### Changelog Configuration (smartcommit.json)
```json
{
  "changelog": {
    "file": "CHANGELOG.md",
    "format": "keep-a-changelog",
    "template": "templates/changelog.md",
    "groupBy": "type",
    "sort": "chronological",
    "includeAuthors": false,
    "includeHashes": false
  },
  "categories": {
    "Added": ["feat", "add", "new"],
    "Changed": ["improve", "update", "modify"],
    "Deprecated": ["deprecate", "obsolete"],
    "Removed": ["remove", "delete"],
    "Fixed": ["fix", "bugfix", "resolve"],
    "Security": ["security", "vulnerability", "patch"]
  },
  "versioning": {
    "autoDetect": true,
    "scheme": "semantic",
    "preRelease": ["alpha", "beta", "rc"],
    "buildMetadata": true
  }
}
```

### Custom Template (templates/changelog.md)
```markdown
## [{{version}}] - {{date}}

{{#each categories}}
### {{this.name}}
{{#each this.commits}}
- {{this.description}} ({{this.hash}})
{{/each}}
{{/each}}

{{#if authors}}
### Contributors
{{#each authors}}
- {{this.name}}
{{/each}}
{{/if}}
```

## Advanced Features:

### Commit Analysis
- **Pattern Recognition**: Identify related commits
- **Impact Assessment**: Determine change significance
- **Dependency Analysis**: Track related modifications
- **Breaking Change Detection**: Identify incompatible changes

### Version Management
- **Semantic Versioning**: Automatic version suggestions
- **Pre-release Handling**: Alpha, beta, RC support
- **Build Metadata**: Include build information
- **Custom Schemes**: Flexible versioning patterns

### Integration Support
- **Release Automation**: Hook into CI/CD pipelines
- **Issue Tracking**: Link to issue management systems
- **Pull Requests**: Generate PR descriptions
- **Release Notes**: Create formatted release notes

## Output Examples:

### Standard Changelog Generation
```bash
📝 Analyzing 15 commits since last release...
🔍 Detected changes: 3 features, 2 improvements, 1 fix
📋 Updating CHANGELOG.md...

✅ Changelog updated:
## [1.2.0] - 2024-01-15

### Added
- Add user authentication system (feat: auth)
- Implement OAuth2 integration (feat: oauth)
- Create user dashboard UI (feat: dashboard)

### Changed
- Improve database query performance (improve: db)
- Update API response format (improve: api)

### Fixed
- Resolve login validation issue (fix: auth)

💡 Suggested version bump: 1.2.0 (minor version)
📦 Version files updated: package.json, pyproject.toml
```

### Detailed Analysis Mode
```bash
🔍 Deep analysis of commit history...
📊 Commit breakdown:
├── Features (5): auth, oauth, dashboard, api, export
├── Improvements (3): performance, ui, testing
├── Bug Fixes (2): validation, memory-leak
├── Documentation (2): readme, api-docs
└── Configuration (1): ci-cd

🏷️  Version analysis:
├── Breaking changes: 0
├── New features: 5
└── Bug fixes: 2
💡 Recommended version: 1.3.0

📝 Changelog generated with detailed descriptions
🔗 Issue references: #123, #456, #789
👥 Authors: 3 contributors
```

### Error Handling
```bash
⚠️  No changelog file found
💡 Creating new CHANGELOG.md in project root

❌ Invalid version format detected
📝 Expected: semantic versioning (1.2.3)
💡 Fix version numbers and retry

🔍 No commits found since last release
💡 Consider using --since flag for wider range
```

## Best Practices:

### Regular Updates
- Update changelog with each release
- Include meaningful descriptions
- Link to relevant issues and PRs
- Maintain consistent formatting

### Team Collaboration
- Establish changelog conventions
- Define change categories
- Set version bumping rules
- Use consistent commit messages

### Project Maintenance
- Keep changelog in version control
- Review entries for accuracy
- Update documentation links
- Maintain backward compatibility

## Integration Examples:

### GitHub Actions
```yaml
name: Update Changelog
on:
  push:
    tags: ['v*']
jobs:
  changelog:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Update changelog
        run: smartcommit.changelog --release
      - name: Commit changelog
        run: |
          git add CHANGELOG.md
          git commit -m "docs: Update changelog for ${{ github.ref_name }}"
          git push
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit
if git diff --cached --name-only | grep -E "(package\.json|pyproject\.toml|Cargo\.toml)"; then
    smartcommit.changelog --update-unreleased
    git add CHANGELOG.md
fi
```

Focus on providing comprehensive changelog management that automatically tracks project changes, maintains version consistency, and integrates seamlessly with development workflows.