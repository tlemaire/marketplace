---
description: Generate intelligent commit messages and update changelog if needed
shortcut: smartcommit.commit
---

# Smart Commit Command

Generate intelligent commit messages based on staged changes and automatically update changelog when necessary.

## What to do:

1. **Analyze git status and staged changes**:
   - Check current git status
   - Identify added, modified, and deleted files
   - Parse file changes to understand the impact
   - Detect change patterns and categorize by type

2. **Categorize changes intelligently**:
   - **Features**: New functionality, feature additions, API changes
   - **Improvements**: Code enhancements, refactoring, performance improvements
   - **Bug Fixes**: Error corrections, issue resolutions, patches
   - **Documentation**: README, docs, comments, examples
   - **Testing**: Test additions, test improvements, test fixes
   - **Configuration**: Build tools, CI/CD, dependencies, environment
   - **Breaking Changes**: Major API changes, backward compatibility issues

3. **Generate commit message**:
   - Follow conventional commit format: `<type>[optional scope]: <description>`
   - Create descriptive, concise summary (50-72 characters)
   - Include relevant scope (affected module/component)
   - Add detailed body when changes are complex
   - Include issue references when detected

4. **Update changelog if necessary**:
   - Check if changelog exists in project
   - Parse existing changelog structure
   - Add new entry under "Unreleased" section
   - Format changes according to Keep a Changelog standard
   - Maintain chronological order

5. **Execute commit**:
   - Present generated commit message to user
   - Allow user to review and modify if needed
   - Execute git commit with the message
   - Provide feedback on completed action

## Commit Message Types

```bash
feat: Add new feature or functionality
improve: Enhance existing code (refactor, performance)
fix: Resolve bug or issue
docs: Update documentation
test: Add or modify tests
config: Configuration or build changes
chore: Maintenance tasks
```

## Usage Examples

### Basic Smart Commit
```bash
# Stage your changes
git add .

# Generate smart commit with changelog update
/smartcommit.commit
```

### Dry Run Mode
```bash
# Preview commit message without committing
/smartcommit.commit --dry-run
```

### Custom Message
```bash
# Generate with custom message template
/smartcommit.commit "Add user authentication system"
```

## Output Examples

### Standard Commit Generation
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

📋 CHANGELOG.md updated with new entry
✅ Commit executed successfully
```

### Dry Run Output
```bash
🔍 Analyzing staged changes...
📝 Detected 2 files modified
🎯 Categorized as: 1 bug fix, 1 documentation

💡 Proposed commit message:
fix(ui): Resolve responsive layout issues on mobile devices

- Fixes navigation menu overflow on small screens
- Adjusts button sizing for touch interfaces
- Improves mobile navigation experience

📋 CHANGELOG.md would be updated
🚀 Dry run - no changes made
💡 Use without --dry-run to execute commit
```

### Error Handling
```bash
❌ No staged changes found. Please stage files first:
   git add <files>

⚠️  Large files detected (>1MB), skipping detailed analysis
💡 Proceeding with basic change categorization
```

## Changelog Integration

The Smart Commit command automatically updates changelogs when:

1. **CHANGELOG.md exists** in project root
2. **Changes are significant** (features, improvements, or important fixes)
3. **Changelog follows Keep a Changelog format**

### Changelog Format
```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- New feature description here

### Fixed
- Bug fix description here
```

## Configuration

### Simple Configuration (smartcommit.json)
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

Focus on providing developers with intelligent, automated commit message generation that maintains consistency across projects while automatically updating changelogs when appropriate.