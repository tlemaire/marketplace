---
description: Show help and guidance for smart commit functionality
shortcut: smartcommit.help
---

# Smart Commit Help Command

Comprehensive help and guidance for intelligent commit message generation, changelog management, and semantic versioning.

## Available Commands

### Core Commands
- **`/smartcommit.commit`** - Generate intelligent commit messages
- **`/smartcommit.changelog`** - Manage changelog entries
- **`/smartcommit.version`** - Handle semantic versioning
- **`/smartcommit.help`** - Show this help information

### Quick Start Examples

#### Basic Workflow
```bash
# Stage your changes
git add .

# Generate smart commit with changelog update
/smartcommit.commit

# Or do it step by step
/smartcommit.changelog
/smartcommit.version
git commit -m "generated message"
```

#### Advanced Workflow
```bash
# Analyze changes without committing
/smartcommit.commit --dry-run

# Generate changelog from recent commits
/smartcommit.changelog --since=2024-01-01

# Bump version based on commit analysis
/smartcommit.version --auto
```

## Core Concepts

### 1. Intelligent Commit Messages
Smart Commit analyzes your staged changes and generates conventional commit messages:

```bash
# Generated examples
feat(auth): Add OAuth2 integration with GitHub providers
improve(api): Optimize database queries for better performance
fix(ui): Resolve responsive layout issues on mobile devices
docs(readme): Update installation instructions for Python 3.11
```

### 2. Automatic Changelog Management
Maintains professional changelogs following industry standards:

```markdown
## [1.2.3] - 2024-01-15

### Added
- User authentication system with OAuth2 support
- Integration with GitHub, Google, and Microsoft providers

### Fixed
- Login validation issues on mobile devices
```

### 3. Semantic Versioning
Automatic version management across multiple configuration formats:

```bash
# Detects project type and updates appropriate files
package.json: 1.2.3 → 1.3.0
pyproject.toml: 1.2.3 → 1.3.0
Cargo.toml: 1.2.3 → 1.3.0
```

## Configuration

### Quick Setup
Create `smartcommit.json` in your project root:

```json
{
  "commitTypes": {
    "feat": "Features",
    "improve": "Improvements",
    "fix": "Bug Fixes",
    "docs": "Documentation",
    "test": "Testing",
    "config": "Configuration",
    "chore": "Maintenance"
  },
  "changelog": {
    "file": "CHANGELOG.md",
    "format": "keep-a-changelog",
    "autoVersion": true
  },
  "versioning": {
    "autoBump": true,
    "files": ["package.json", "pyproject.toml"],
    "scheme": "semantic"
  }
}
```

### Project Types Supported
- **Node.js**: package.json, npm, yarn
- **Python**: pyproject.toml, setup.py, requirements.txt
- **Rust**: Cargo.toml, Cargo.lock
- **PHP**: composer.json
- **Dart/Flutter**: pubspec.yaml
- **Java**: pom.xml, build.gradle
- **Ruby**: Gemfile, *.gemspec
- **Go**: go.mod
- **C#**: *.csproj, package.config

## Integration Examples

### Git Hooks Integration
```bash
# .git/hooks/prepare-commit-msg
#!/bin/sh
smartcommit --prepare-msg "$1"
```

### Pre-commit Integration
```yaml
# .pre-commit-config.yaml
repos:
  - repo: local
    hooks:
      - id: smartcommit
        name: Smart Commit
        entry: smartcommit
        language: system
        stages: [commit]
```

### GitHub Actions
```yaml
# .github/workflows/release.yml
name: Release
on:
  push:
    tags: ['v*']
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Update changelog
        run: smartcommit.changelog --release
      - name: Bump version
        run: smartcommit.version --set=${GITHUB_REF#refs/tags/v}
```

## Workflow Examples

### New Feature Development
```bash
# 1. Create feature branch
git checkout -b feature/user-authentication

# 2. Implement your feature
# ... (development work)

# 3. Stage your changes
git add .

# 4. Generate smart commit
/smartcommit.commit
# Output: "feat(auth): Add user authentication system"

# 5. Update changelog automatically
/smartcommit.changelog

# 6. Bump version if needed
/smartcommit.version --minor

# 7. Merge and release
git checkout main
git merge feature/user-authentication
git tag v1.2.0
```

### Bug Fix Process
```bash
# 1. Fix the issue
# ... (bug fixing work)

# 2. Stage changes
git add .

# 3. Generate commit for bug fix
/smartcommit.commit
# Output: "fix(auth): Resolve login validation for special characters"

# 4. Update changelog
/smartcommit.changelog

# 5. Bump patch version
/smartcommit.version --patch

# 6. Release patch
git tag v1.1.1
```

### Documentation Update
```bash
# 1. Update documentation
# ... (documentation work)

# 2. Stage changes
git add README.md docs/

# 3. Generate commit
/smartcommit.commit
# Output: "docs(readme): Update installation guide with Docker instructions"

# 4. Update changelog (optional for docs)
/smartcommit.changelog

# 5. No version bump needed for docs-only changes
```

## Best Practices

### Commit Message Standards
- **Conventional Commits**: Follow `<type>[<scope>]: <description>` format
- **Clear Descriptions**: Keep summary under 72 characters
- **Imperative Mood**: Use "Add", "Fix", "Update" instead of "Added", "Fixed"
- **Scope Inclusion**: Specify affected module when relevant

### Changelog Maintenance
- **Keep it Updated**: Update with every release
- **Group Changes**: Organize by type (Added, Fixed, Changed)
- **Link Issues**: Reference relevant issue numbers
- **Date Stamps**: Include release dates

### Version Management
- **Semantic Versioning**: Follow MAJOR.MINOR.PATCH scheme
- **Consistent Updates**: Update all version files together
- **Tag Releases**: Create git tags for releases
- **Document Breaking Changes**: Clearly communicate API changes

### Team Collaboration
- **Establish Standards**: Agree on commit types and formats
- **Use Templates**: Create templates for consistent messages
- **Regular Reviews**: Review commit messages for quality
- **Automation**: Use hooks and CI/CD integration

## Troubleshooting

### Common Issues

#### No Staged Changes
```bash
❌ No staged changes found. Please stage files first:
   git add <files>

💡 Quick fix:
   git add .        # Stage all changes
   git add *.py     # Stage Python files only
   git add src/     # Stage specific directory
```

#### Version Inconsistency
```bash
⚠️  Version inconsistency detected!
💡 package.json: 1.2.3
💡 pyproject.toml: 1.2.4

📝 Fix with:
   /smartcommit.version --set=1.2.3
   /smartcommit.version --sync
```

#### Changelog Format Issues
```bash
❌ Invalid changelog format detected
💡 Expected: Keep a Changelog format
📝 Fix with:
   /smartcommit.changelog --format=keep-a-changelog
```

### Getting Help
```bash
# Show specific command help
/smartcommit.commit --help
/smartcommit.changelog --help
/smartcommit.version --help

# Show current configuration
/smartcommit.config

# Validate setup
/smartcommit.doctor

# Show diagnostic information
/smartcommit --verbose --dry-run
```

## Advanced Features

### Custom Templates
Create custom commit message templates:

```json
{
  "templates": {
    "feature": "feat({scope}): {description}\n\nImplements {user_story}\nFixes #{issue_number}",
    "bugfix": "fix({scope}): {description}\n\nResolves {problem}\nCloses #{issue_number}"
  }
}
```

### Integration with Project Management
Link commits to external systems:

```json
{
  "integrations": {
    "jira": {
      "enabled": true,
      "project": "PROJ",
      "url": "https://your-company.atlassian.net"
    },
    "linear": {
      "enabled": true,
      "team": "ENG"
    },
    "github": {
      "enabled": true,
      "repo": "username/repo"
    }
  }
}
```

### Custom File Types
Add support for custom version files:

```json
{
  "customFiles": [
    {
      "path": "src/version.py",
      "pattern": "VERSION = \"(.+)\"",
      "replacement": "VERSION = \"{version}\""
    },
    {
      "path": "Dockerfile",
      "pattern": "ENV VERSION=(.+)",
      "replacement": "ENV VERSION={version}"
    }
  ]
}
```

## Resources

### Documentation
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)

### Configuration Examples
- [Node.js Project](docs/examples/nodejs.md)
- [Python Project](docs/examples/python.md)
- [Rust Project](docs/examples/rust.md)
- [Multi-language Project](docs/examples/multi-language.md)

### Integration Guides
- [Git Hooks Setup](docs/integrations/git-hooks.md)
- [CI/CD Integration](docs/integrations/cicd.md)
- [IDE Extensions](docs/integrations/ide.md)

---

For more detailed information, visit the [Smart Commit documentation](docs/README.md) or check the [examples directory](samples/).

Need help? Open an issue on [GitHub](https://github.com/tlemaire/marketplace).