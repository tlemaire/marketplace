---
description: Show help and guidance for smart commit functionality
shortcut: smartcommit.help
---

# Smart Commit Help Command

Comprehensive help and guidance for intelligent commit message generation with automatic changelog updates.

## Available Command

### Core Command
- **`/smartcommit.commit`** - Generate intelligent commit messages with automatic changelog updates

## Quick Start Examples

### Basic Workflow
```bash
# Stage your changes
git add .

# Generate smart commit with automatic changelog update
/smartcommit.commit
```

### Advanced Workflow
```bash
# Analyze changes without committing
/smartcommit.commit --dry-run

# Generate with custom message
/smartcommit.commit "Add user authentication system"
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

### 2. Automatic Changelog Updates
When CHANGELOG.md exists, SmartCommit automatically adds entries:

```markdown
## [Unreleased]

### Added
- User authentication system with OAuth2 support
- Integration with GitHub, Google, and Microsoft providers

### Fixed
- Login validation issues on mobile devices
```

## Usage Examples

### New Feature Development
```bash
# 1. Implement your feature
# ... (development work)

# 2. Stage changes
git add .

# 3. Generate smart commit
/smartcommit.commit
# Output: "feat(auth): Add user authentication system"

# 4. Done! Changelog updated automatically
```

### Bug Fix Process
```bash
# 1. Fix the issue
# ... (bug fixing work)

# 2. Stage changes
git add .

# 3. Generate commit
/smartcommit.commit
# Output: "fix(auth): Resolve login validation for special characters"

# 4. Changelog updated automatically
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

# 4. No changelog update for documentation-only changes
```

## Configuration

### Zero Configuration Required
SmartCommit works out of the box! No setup needed.

### Optional Configuration
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
    "updateAutomatically": true
  }
}
```

## Command Options

### Standard Usage
```bash
/smartcommit.commit
```
- Analyzes staged changes
- Generates commit message
- Updates changelog if needed
- Executes commit

### Dry Run Mode
```bash
/smartcommit.commit --dry-run
```
- Analyzes changes without committing
- Shows proposed commit message
- Indicates changelog update status
- No changes made to repository

### Custom Message
```bash
/smartcommit.commit "Custom commit message"
```
- Uses provided message instead of generated one
- Still analyzes changes for context
- Updates changelog if needed

## Best Practices

### Before Committing
- Ensure changes are properly staged
- Review generated commit message
- Check changelog formatting if applicable
- Verify commit message clarity and accuracy

### Commit Message Standards
- Use conventional commit format
- Keep summary under 72 characters
- Use imperative mood ("Add" not "Added")
- Include scope when relevant

### Team Collaboration
- Establish commit type conventions
- Share changelog format standards
- Use consistent issue reference format

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

#### Changelog Issues
```bash
⚠️  CHANGELOG.md format not recognized
💡 Expected: Keep a Changelog format
📝 Create or fix CHANGELOG.md structure

⚠️  Skipping changelog update
💡 Changes not significant enough for changelog
```

#### Large Files
```bash
⚠️  Large files detected (>1MB), skipping detailed analysis
💡 Proceeding with basic change categorization
```

### Getting Help
```bash
# Show this help information
/smartcommit.help

# Check git status
git status

# Show recent commits
git log --oneline -5
```

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

## Resources

### External Documentation
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)

### Configuration Examples
- [Simple Project](samples/simple/README.md) - Basic usage with single configuration file
- [Multi-language Project](samples/multi-language/README.md) - Advanced usage with multiple formats

### Integration Guides
- [Git Hooks](../README.md#git-hooks) - Setup instructions in main README
- [Pre-commit Integration](../README.md#pre-commit-integration) - Configuration examples in main README
- [GitHub Actions](../README.md#github-actions) - CI/CD workflow examples in main README

---

For more detailed information, check the [main README.md](../README.md) documentation or explore the [examples directory](../samples/).

Need help? Open an issue on [GitHub](https://github.com/tlemaire/marketplace).