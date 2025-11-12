---
description: Generate intelligent commit messages and update changelog automatically
shortcut: smartcommit.commit
---

# Smart Commit Command

Generate intelligent commit messages based on staged changes, automatically update changelog, and manage versioning across multiple configuration formats.

## What to do:

1. **Analyze git status and staged changes**:
   - Check current git status
   - Identify added, modified, and deleted files
   - Parse file changes to understand the impact
   - Detect change patterns and categorize by type

2. **Detect project configuration**:
   - Search for version files: `package.json`, `pyproject.toml`, `Cargo.toml`, `composer.json`, etc.
   - Identify changelog files: `CHANGELOG.md`, `CHANGELOG.rst`, `HISTORY.md`
   - Detect project type and technology stack
   - Check for conventional commit configuration

3. **Categorize changes intelligently**:
   - **Features**: New functionality, feature additions, API changes
   - **Improvements**: Code enhancements, refactoring, performance improvements
   - **Bug Fixes**: Error corrections, issue resolutions, patches
   - **Documentation**: README, docs, comments, examples
   - **Testing**: Test additions, test improvements, test fixes
   - **Configuration**: Build tools, CI/CD, dependencies, environment
   - **Breaking Changes**: Major API changes, backward compatibility issues

4. **Generate commit message**:
   - Follow conventional commit format: `<type>[optional scope]: <description>`
   - Create descriptive, concise summary (50-72 characters)
   - Include relevant scope (affected module/component)
   - Add detailed body when changes are complex
   - Include issue references when detected

5. **Update changelog automatically**:
   - Parse existing changelog structure
   - Add new entry under appropriate version section
   - Format changes according to Keep a Changelog standard
   - Include version bump if detected
   - Maintain chronological order

6. **Version management**:
   - Detect semantic versioning patterns
   - Suggest version bump based on change types
   - Update version in configuration files
   - Support multiple formats (.toml, .json, .yaml)

## Commit Message Generation:

### Message Types
```bash
feat: Add new feature or functionality
improve: Enhance existing code (refactor, performance)
fix: Resolve bug or issue
docs: Update documentation
test: Add or modify tests
config: Configuration or build changes
chore: Maintenance tasks
```

### Message Format
```markdown
<type>[<scope>]: <description>

[optional body explaining what and why]

[optional footer with issue references, breaking changes, etc.]
```

### Examples
```bash
feat(auth): Add OAuth2 integration with GitHub
improve(api): Optimize database queries for better performance
fix(ui): Resolve responsive layout issues on mobile devices
docs(readme): Update installation instructions for Python 3.11
test(unit): Add comprehensive test coverage for user service
config(ci): Update GitHub Actions workflow for automated testing
```

## Changelog Integration:

### Format Detection
- **Keep a Changelog**: Standard markdown format with version sections
- **Custom Formats**: Adaptable parsing for existing changelog structures
- **Multiple Files**: Support for `CHANGELOG.md`, `HISTORY.md`, `RELEASES.md`

### Automatic Updates
```markdown
## [1.2.3] - 2024-01-15

### Added
- New feature description with relevant details

### Improved
- Performance enhancement with metrics

### Fixed
- Bug resolution with issue reference

### Documentation
- Updated documentation sections
```

## Version Management:

### Supported Configuration Files
- `package.json` (Node.js/JavaScript)
- `pyproject.toml` (Python/Poetry)
- `Cargo.toml` (Rust)
- `composer.json` (PHP)
- `pubspec.yaml` (Dart/Flutter)
- `pom.xml` (Maven/Java)
- `.version` (Custom version files)

### Version Bump Logic
- **Major**: Breaking changes, API modifications
- **Minor**: New features, additions, improvements
- **Patch**: Bug fixes, documentation, testing
- **None**: Configuration, maintenance tasks

## Usage Examples:

### Basic Smart Commit
```bash
# Stage your changes
git add .

# Generate smart commit
/smartcommit.commit
```

### With Custom Message
```bash
/smartcommit.commit "Add user authentication system"
```

### With Specific Type
```bash
/smartcommit.commit --type=feat "Add OAuth integration"
```

### With Changelog Update Only
```bash
/smartcommit.commit --changelog-only
```

### Dry Run Mode
```bash
/smartcommit.commit --dry-run
```

## Configuration:

### Project Configuration (smartcommit.json)
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

### Conventional Commits Configuration
```toml
# .conventionalcommits.toml
[types]
feat = { description = "New feature", changelog = true }
improve = { description = "Code improvement", changelog = true }
fix = { description = "Bug fix", changelog = true }
docs = { description = "Documentation", changelog = false }
test = { description = "Testing", changelog = false }
```

## Integration:

### Git Hooks
Automatically trigger smart commit for better consistency:
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

## Output:

### Commit Generation
```bash
🔍 Analyzing staged changes...
📝 Detected 3 files modified, 2 files added
🎯 Categorized as: 1 feature, 1 improvement, 1 documentation

💡 Generated commit message:
feat(auth): Add OAuth2 integration with GitHub providers

- Implements OAuth2 flow for user authentication
- Supports GitHub, Google, and Microsoft providers
- Includes token refresh and session management
- Fixes #123, addresses #456

📋 CHANGELOG.md updated with version 1.2.3
📦 package.json version bumped to 1.2.3
✅ Commit ready for review
```

### Error Handling
```bash
❌ No staged changes found. Please stage files first:
   git add <files>

⚠️  Detected breaking changes without major version bump
💡 Suggested version: 2.0.0 (current: 1.x.x)
📝 Update version files and retry
```

## Best Practices:

### Before Committing
- Ensure changes are properly staged
- Review generated commit message
- Check changelog formatting
- Verify version bump logic

### Team Collaboration
- Establish commit type conventions
- Configure changelog format standards
- Set up version bumping rules
- Use consistent project structure

### Large Projects
- Use descriptive scopes for modules
- Link issues and pull requests
- Document breaking changes clearly
- Maintain consistent changelog format

## Advanced Features:

### Change Pattern Detection
- **File Type Analysis**: Code vs docs vs config
- **Impact Assessment**: Surface area of changes
- **Dependency Analysis**: Import/export changes
- **API Changes**: Interface modifications

### Custom Templates
- **Project-specific** commit templates
- **Team-based** changelog formats
- **Multi-language** support
- **Custom versioning** schemes

### Integration Support
- **IDE Extensions**: VS Code, IntelliJ
- **CI/CD Integration**: GitHub Actions, GitLab CI
- **Project Management**: Jira, Linear integration
- **Release Management**: Automated releases

Focus on providing developers with intelligent, automated commit message generation that maintains consistency across projects while supporting multiple configuration formats and team workflows.