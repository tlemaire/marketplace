# SmartCommit - Intelligent Git Commit Management

Automated commit message generation, changelog management, and semantic versioning for modern development workflows.

## What is SmartCommit?

**SmartCommit** is a comprehensive Claude Code plugin that transforms the commit process through intelligent analysis of staged changes, automatic changelog generation, and seamless version management across multiple project types and configuration formats.

### Core Philosophy
- **Intelligence First**: Analyze code changes to generate meaningful commit messages
- **Consistency Always**: Maintain uniform commit messages and changelog format
- **Version Awareness**: Handle semantic versioning automatically across all project files
- **Format Agnostic**: Support multiple configuration formats (.json, .toml, .yaml, .xml)
- **Team Ready**: Scale from solo projects to enterprise development teams

## Why Use SmartCommit?

**For Individual Developers:**
- 🎯 **Better Commits**: Generate meaningful, conventional commit messages automatically
- ⚡ **Save Time**: No more thinking about commit message formatting
- 🔧 **Consistency**: Maintain professional commit history effortlessly
- 📈 **Professionalism**: Clean, readable git history with proper changelogs

**For Development Teams:**
- 🤝 **Standardization**: Consistent commit messages across the entire team
- 📋 **Traceability**: Clear link between commits, changelogs, and versions
- 🔄 **Onboarding**: Easy for new team members to follow commit standards
- 📊 **Release Management**: Automated version bumping and changelog updates

**For Project Maintainers:**
- 🏛️ **Governance**: Enforce commit message standards automatically
- 🔒 **Quality**: Built-in validation and formatting checks
- 📈 **Scalability**: Handles projects of any size and complexity
- 💰 **Efficiency**: Streamlined release process with minimal manual intervention

## Quick Start

### Installation
Add SmartCommit to your Claude Code marketplace plugins:
```bash
claude plugin marketplace add smartcommit
```

### Basic Usage
```bash
# Stage your changes
git add .

# Generate intelligent commit message (with automatic changelog update)
/smartcommit.commit

# Preview commit message without committing
/smartcommit.commit --dry-run

# Use custom message template
/smartcommit.commit "Add user authentication system"
```

### Typical Workflow
```bash
# 1. Make your changes
# ... (development work)

# 2. Stage changes
git add .

# 3. Generate smart commit (handles changelog automatically)
/smartcommit.commit
# Output: feat(auth): Add OAuth2 integration with GitHub

# 4. Done! Changelog updated automatically if it exists

# 5. For releases, manually bump version and tag
git tag v1.2.0
git push origin v1.2.0
```

## Command

### Single Smart Command
- **`/smartcommit.commit`** - Generate intelligent commit messages, update changelog if needed, and execute the commit automatically

### Usage Options
```bash
# Standard smart commit
/smartcommit.commit

# Preview without committing
/smartcommit.commit --dry-run

# Custom message
/smartcommit.commit "Custom commit message"
```

## Features

### 🧠 **Intelligent Commit Analysis**
- **Change Detection**: Analyzes file additions, modifications, and deletions
- **Pattern Recognition**: Identifies common development patterns and changes
- **Scope Inference**: Determines affected modules and components
- **Type Classification**: Categorizes changes as features, improvements, fixes, etc.
- **Context Awareness**: Understands project structure and dependencies

### 📝 **Conventional Commit Generation**
- **Standard Format**: Follows conventional commit specification
- **Smart Scoping**: Automatically determines appropriate scope
- **Descriptive Messages**: Generates clear, concise commit descriptions
- **Issue Integration**: Links to relevant issue numbers automatically
- **Breaking Change Detection**: Identifies and highlights breaking changes

### 📋 **Automatic Changelog Updates**
- **Smart Detection**: Automatically finds and updates existing CHANGELOG.md
- **Format Standards**: Follows Keep a Changelog specification
- **Change Categorization**: Groups changes by type (Added, Fixed, Changed)
- **Conditional Updates**: Updates changelog only for significant changes
- **Integration Ready**: Works with existing changelog formats

### ⚡ **Simplified Workflow**
- **Single Command**: One command handles commit + changelog
- **Preview Mode**: Dry-run option to review before committing
- **Custom Messages**: Support for custom commit message templates
- **Zero Configuration**: Works out of the box with no setup required

## Generated Files

SmartCommit creates and maintains professional project documentation:

### Changelog Format
```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [1.2.3] - 2024-01-15

### Added
- User authentication system with OAuth2 support
- Integration with GitHub, Google, and Microsoft providers

### Fixed
- Login validation issues on mobile devices
- Token refresh handling in edge cases

### Changed
- Improved API response format for better performance
- Updated dependencies for security patches
```

### Version Configuration
SmartCommit automatically updates version numbers in:
```json
// package.json
{
  "name": "my-project",
  "version": "1.2.3"
}
```

```toml
# pyproject.toml
[tool.poetry]
name = "my-project"
version = "1.2.3"
```

## Configuration

### Zero Configuration Required
SmartCommit works out of the box with no setup needed! Just run:
```bash
/smartcommit.commit
```

### Optional Configuration
Create `smartcommit.json` in your project root for customization:

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
    "updateAutomatically": true
  }
}
```

### Changelog Integration
SmartCommit automatically updates changelogs when:
1. **CHANGELOG.md exists** in project root
2. **Changes are significant** (features, improvements, or important fixes)
3. **Changelog follows Keep a Changelog format**

## Integration Examples

### Git Hooks
```bash
#!/bin/sh
# .git/hooks/prepare-commit-msg
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

## Examples

### Feature Development
```bash
# After implementing a new authentication system
git add src/auth/ tests/auth/

/smartcommit.commit
# Output: "feat(auth): Add OAuth2 integration with GitHub providers"

/smartcommit.changelog
# Updates CHANGELOG.md with new feature entry

/smartcommit.version --minor
# Bumps version: 1.2.3 → 1.3.0
```

### Bug Fix
```bash
# After fixing a validation issue
git add src/validation/ tests/

/smartcommit.commit
# Output: "fix(validation): Resolve email format validation for edge cases"

/smartcommit.changelog
# Updates CHANGELOG.md with fix entry

/smartcommit.version --patch
# Bumps version: 1.2.3 → 1.2.4
```

### Documentation Update
```bash
# After updating README
git add README.md docs/

/smartcommit.commit
# Output: "docs(readme): Update installation instructions with Docker support"

# Optional changelog update for major documentation changes
/smartcommit.changelog

# No version bump for documentation-only changes
```

## Advanced Features

### Custom Commit Templates
```json
{
  "templates": {
    "feature": "feat({scope}): {description}\n\nImplements {user_story}\nFixes #{issue}",
    "bugfix": "fix({scope}): {description}\n\nResolves {problem}\nCloses #{issue}",
    "docs": "docs({scope}): {description}\n\nUpdated {sections}"
  }
}
```

### Integration with External Systems
```json
{
  "integrations": {
    "jira": {
      "enabled": true,
      "project": "PROJ",
      "url": "https://company.atlassian.net"
    },
    "github": {
      "enabled": true,
      "repo": "username/repo",
      "autoLink": true
    },
    "slack": {
      "enabled": true,
      "webhook": "https://hooks.slack.com/...",
      "channel": "#releases"
    }
  }
}
```

### Multi-Language Projects
SmartCommit automatically detects and manages versions in:
- **Node.js monorepos** with multiple package.json files
- **Python projects** with pyproject.toml and setup.py
- **Rust workspaces** with Cargo.toml
- **Mixed projects** with multiple configuration formats

## Benefits

### Consistency
- Standardized commit messages across all team members
- Uniform changelog format following industry standards
- Consistent version numbering across all configuration files

### Productivity
- Eliminates time spent on commit message formatting
- Automates changelog maintenance
- Streamlines release process with version automation

### Quality
- Professional git history with meaningful messages
- Complete change tracking with proper categorization
- Clear version progression with semantic versioning

### Collaboration
- Easy onboarding for new team members
- Clear communication through standardized messages
- Seamless integration with existing development workflows

## Documentation

- [Command Reference](#commands) - Core commands and usage examples
- [Configuration Guide](#configuration) - Setup and customization options
- [Integration Examples](#integration-examples) - Git hooks, CI/CD, and workflows
- [Samples](#examples-1) - Complete examples in samples/ directory
- [Troubleshooting](#commands) - Common issues and solutions in help command

## Examples

Explore the `samples/` directory for complete examples:

### 🟢 **Simple Project** - `samples/simple/`
- Basic commit generation and changelog management
- Single configuration file (package.json)
- Straightforward version management

### 🟡 **Multi-language Project** - `samples/multi-language/`
- Multiple configuration formats (package.json, pyproject.toml)
- Cross-file version synchronization
- Complex project structure

### 🔴 **Enterprise Project** - `samples/enterprise/`
- Team collaboration features
- Custom templates and integrations
- Advanced configuration and automation

## Version

- **Version**: 1.0.0
- **Commands**: 4 core commands with extensive options
- **Languages**: Support for 10+ programming languages
- **Configuration**: JSON, TOML, YAML, XML formats
- **License**: MIT

---

Transform your commit process with SmartCommit - making git history meaningful, releases automated, and development teams more productive.