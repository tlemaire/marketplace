---
description: Setup automatic Git hooks for code validation and documentation updates
shortcut: sdd.setup-hooks
shortcut_example: "/sdd.setup-hooks --pre-commit --pre-push"
parameters:
  - name: hooks
    type: string
    required: false
    description: Git hooks to setup (pre-commit, pre-push, commit-msg, pre-rebase)
    examples:
      - pre-commit
      - pre-push
      - commit-msg
      - pre-rebase
      - all
  - name: force
    type: boolean
    required: false
    description: Overwrite existing hooks
    examples:
      - true
      - false
  - name: validate-level
    type: string
    required: false
    description: Validation strictness level (strict, normal, lenient)
    examples:
      - strict
      - normal
      - lenient
  - name: docs-update
    type: boolean
    required: false
    description: Enable automatic documentation updates in hooks
    examples:
      - true
      - false
examples:
  - description: Setup all Git hooks with strict validation
    command: /sdd.setup-hooks --hooks all --validate-level strict
  - description: Setup only pre-commit hook with normal validation
    command: /sdd.setup-hooks --hooks pre-commit --validate-level normal
  - description: Setup hooks with automatic documentation updates
    command: /sdd.setup-hooks --hooks pre-commit,pre-push --docs-update
---

# SDD Git Hooks Setup

**Purpose**: Automatic Git hooks setup for code validation and documentation updates to enforce quality standards.

## Git Hooks Available

### Pre-commit Hook (Recommended)
Runs before each commit:
- Code validation on staged files
- Automatic formatting and fixes
- Documentation synchronization
- Test validation

### Pre-push Hook
Runs before each push:
- Full branch validation
- Integration testing
- Performance checks
- Security scanning

### Commit-msg Hook
Validates commit messages:
- Conventional commit format
- Required issue references
- Message length validation
- Prohibited patterns

### Pre-rebase Hook
Runs before rebase operations:
- Branch compatibility check
- Conflict prevention
- History validation

## Hook Configurations

### Strict Validation Level
```bash
# Fails on any issue
- Code quality: No tolerance
- Test coverage: Minimum 90%
- Documentation: 100% complete
- Security: Zero vulnerabilities
```

### Normal Validation Level (Recommended)
```bash
# Warns on minor issues, fails on critical
- Code quality: Auto-fix minor issues
- Test coverage: Minimum 80%
- Documentation: Auto-update missing parts
- Security: Block vulnerabilities
```

### Lenient Validation Level
```bash
# Mostly warnings and suggestions
- Code quality: Suggestions only
- Test coverage: Minimum 70%
- Documentation: Recommendations
- Security: Critical issues only
```

## Generated Hook Scripts

### Pre-commit Hook Script
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🔍 Running SDD pre-commit validation..."

# Get list of staged files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(ts|tsx|js|jsx)$')

if [ -n "$STAGED_FILES" ]; then
  echo "📝 Validating staged files..."

  # Code validation with auto-fix
  /sdd.code-validate --scope staged --fix --update-docs

  if [ $? -ne 0 ]; then
    echo "❌ Code validation failed"
    echo "Fix the issues and try again"
    exit 1
  fi

  # Add auto-fixed files back to staging
  git add .

  echo "✅ All staged files validated"
else
  echo "ℹ️ No code files to validate"
fi

# Check for large files
LARGE_FILES=$(git diff --cached --name-only | xargs ls -la 2>/dev/null | awk '$5 > 10485760 {print $9}')
if [ -n "$LARGE_FILES" ]; then
  echo "⚠️ Warning: Large files detected:"
  echo "$LARGE_FILES"
  echo "Consider using Git LFS for large files"
fi

echo "✅ Pre-commit validation passed"
```

### Pre-push Hook Script
```bash
#!/bin/sh
# .git/hooks/pre-push

echo "🚀 Running SDD pre-push validation..."

# Get current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📋 Branch: $CURRENT_BRANCH"

# Full code validation
echo "🔍 Running full code validation..."
/sdd.code-validate --scope all --strict

if [ $? -ne 0 ]; then
  echo "❌ Full code validation failed"
  echo "Fix issues before pushing"
  exit 1
fi

# Run comprehensive tests
if command -v npm >/dev/null 2>&1; then
  echo "🧪 Running comprehensive tests..."
  npm run test:coverage

  if [ $? -ne 0 ]; then
    echo "❌ Test suite failed"
    echo "Fix failing tests before pushing"
    exit 1
  fi
fi

# Check if documentation is up to date
echo "📚 Checking documentation sync..."
/sdd.docs-sync --auto --dry-run

if [ $? -ne 0 ]; then
  echo "⚠️ Documentation updates available"
  echo "Consider running: /sdd.docs-sync --auto"
fi

# Branch protection check
if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
  echo "🛡️ Protecting main branch"
  echo "Use pull requests for main branch changes"
  exit 1
fi

echo "✅ Pre-push validation passed"
```

### Commit-msg Hook Script
```bash
#!/bin/sh
# .git/hooks/commit-msg

COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

echo "📝 Validating commit message..."

# Check commit message length
if [ ${#COMMIT_MSG} -lt 10 ]; then
  echo "❌ Commit message too short (minimum 10 characters)"
  exit 1
fi

if [ ${#COMMIT_MSG} -gt 100 ]; then
  echo "❌ Commit message too long (maximum 100 characters for first line)"
  exit 1
fi

# Check for conventional commit format
if ! echo "$COMMIT_MSG" | grep -qE "^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .{1,}"; then
  echo "❌ Commit message should follow conventional commit format:"
  echo "  type(scope): description"
  echo "  types: feat, fix, docs, style, refactor, test, chore"
  exit 1
fi

# Check for issue reference (if configured)
ISSUE_REQUIRED=false
if [ "$ISSUE_REQUIRED" = true ]; then
  if ! echo "$COMMIT_MSG" | grep -qE "#[0-9]+"; then
    echo "❌ Commit message should reference an issue (#123)"
    exit 1
  fi
fi

# Check for prohibited patterns
if echo "$COMMIT_MSG" | grep -qiE "(wip|fixme|todo|temporary)"; then
  echo "⚠️ Warning: Commit message contains work-in-progress indicators"
fi

echo "✅ Commit message validation passed"
```

## Setup Examples

### Basic Setup (Recommended)
```bash
# Setup pre-commit hook with normal validation
/sdd.setup-hooks --hooks pre-commit --validate-level normal --docs-update
```

### Strict Setup (Production Projects)
```bash
# Setup all hooks with strict validation
/sdd.setup-hooks --hooks all --validate-level strict --force
```

### Team Setup
```bash
# Setup team-friendly hooks
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level normal --docs-update
```

## Configuration File

### SDD Hooks Configuration (.sdd/hooks.json)
```json
{
  "preCommit": {
    "enabled": true,
    "validationLevel": "normal",
    "autoFix": true,
    "updateDocs": true,
    "runTests": false,
    "maxFileSize": "10MB"
  },
  "prePush": {
    "enabled": true,
    "validationLevel": "strict",
    "runTests": true,
    "coverageThreshold": 80,
    "branchProtection": true
  },
  "commitMsg": {
    "enabled": true,
    "conventionalCommits": true,
    "minLength": 10,
    "maxLength": 100,
    "requireIssue": false,
    "allowedTypes": ["feat", "fix", "docs", "style", "refactor", "test", "chore"]
  },
  "notifications": {
    "slack": false,
    "email": false,
    "console": true
  }
}
```

## Integration with Development Workflow

### IDE Integration
```json
// .vscode/settings.json
{
  "git.autofetch": true,
  "git.enableSmartCommit": true,
  "git.postCommitCommand": "none",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```

### Team Onboarding
```bash
# New developer setup script
#!/bin/bash
echo "🚀 Setting up development environment..."

# Install dependencies
npm install

# Setup SDD hooks
/sdd.setup-hooks --hooks all --validate-level normal

# Initialize configuration
/sdd.code-validate --init-config
/sdd.docs-sync --init-config

echo "✅ Development environment ready!"
```

## Output Examples

### Successful Setup
```
✅ Git hooks setup completed!

📊 Setup Summary:
- Pre-commit hook: ✅ Installed
- Pre-push hook: ✅ Installed
- Commit-msg hook: ✅ Installed
- Validation level: normal
- Auto-documentation: ✅ Enabled

🔧 Hook Configuration:
- Code validation: Auto-fix enabled
- Documentation updates: Automatic
- Test requirements: Staged files only
- File size limit: 10MB

📋 Next Steps:
1. Test hooks by making a commit
2. Review generated hook files
3. Customize configuration if needed
4. Share .sdd/hooks.json with team
```

### Setup with Warnings
```
⚠️ Git hooks setup completed with warnings:

📊 Setup Summary:
- Pre-commit hook: ✅ Installed
- Pre-push hook: ❌ Already exists (use --force to overwrite)
- Commit-msg hook: ✅ Installed

⚠️ Warnings:
- Pre-push hook already exists, use --force to overwrite
- Consider backing up existing hooks first

💡 Recommendations:
- Review existing pre-push hook compatibility
- Test hooks before force overwriting
- Share hook configuration with team
```

## Best Practices

### For Individual Developers
1. **Start with pre-commit**: Most valuable for daily work
2. **Normal validation**: Balanced between quality and productivity
3. **Auto-documentation**: Keep docs in sync automatically
4. **Test hooks**: Verify hooks work before committing

### For Development Teams
1. **Consistent configuration**: Share .sdd/hooks.json
2. **Team onboarding**: Include hooks setup in onboarding process
3. **Gradual adoption**: Start with warnings, progress to strict
4. **Documentation**: Document hook requirements in project README

### For Production Projects
1. **Strict validation**: Enforce high quality standards
2. **Full hook suite**: Use all available hooks
3. **Branch protection**: Protect main/master branches
4. **Integration testing**: Comprehensive test requirements

This automated hook system ensures that every code change meets quality standards and maintains documentation consistency without requiring manual intervention.