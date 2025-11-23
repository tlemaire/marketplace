# 🔒 SDD Quality Assurance Workflow

## Overview

This document demonstrates the complete quality assurance workflow integrated into SDD, ensuring every code change is validated and documentation stays synchronized.

## 🚀 Quick Setup (One-time)

```bash
# Check SDD is current with GitHub Spec Kit
/sdd.update-github-spec-kit --check-only

# Setup automated validation hooks
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level normal --docs-update

# Initialize validation configuration
/sdd.code-validate --init-config
/sdd.docs-sync --init-config
```

## 📋 Complete Development Workflow

### Phase 1: Project Initialization

```bash
# 1. Set quality standards
/sdd.constitution "security, performance, documentation, testing"

# 2. Create specification
/sdd.specify "User authentication system with React and TypeScript"

# 3. Technical planning
/sdd.plan "React, TypeScript, Node.js, Express, PostgreSQL, Jest"

# 4. Setup testing strategy
/sdd.tdd.specify "unit,integration,e2e"

# 5. Generate tasks
/sdd.tasks
```

### Phase 2: Implementation with Quality Gates

```bash
# Start implementation (automatically validates environment)
/sdd.implement

# During implementation, each commit triggers:
# ✅ Pre-commit hook:
#   - Code validation: /sdd.code-validate --scope staged --fix --update-docs
#   - Documentation sync: /sdd.docs-sync --auto
#   - Test validation: npm test (if tests exist)
#   - Formatting: Prettier/ESLint auto-fix

# ✅ Pre-push hook:
#   - Full validation: /sdd.code-validate --scope all --strict
#   - Comprehensive tests: npm run test:coverage
#   - Security scan: npm audit
#   - Performance check: Bundle analysis
```

### Phase 3: Post-Implementation Validation

```bash
# Final comprehensive validation
/sdd.code-validate --scope all --strict
/sdd.docs-sync --all --auto
/sdd.validate --report

# Quality checklists
/sdd.checklist "security"
/sdd.checklist "performance"
/sdd.checklist "accessibility"
/sdd.checklist "documentation"
```

## 🔧 Validation Examples

### Example 1: Adding a New Feature

```bash
# Feature specification
/sdd.specify "Add user profile management"

# Implementation
/sdd.implement

# Automatic validation happens on each commit:
git add .
git commit -m "feat: add user profile management"
# → Runs: code validation, doc sync, tests

# Final validation before merge
/sdd.code-validate --scope all --strict
/sdd.docs-sync --all --auto
```

### Example 2: Fixing a Bug

```bash
# Bug fix implementation
git checkout -b fix/user-authentication-bug
# ... make changes ...

# Validation with auto-fix
/sdd.code-validate --scope staged --fix --update-docs

# Commit with validation
git add .
git commit -m "fix: resolve authentication timeout issue"
# → Auto-applies formatting fixes
# → Updates relevant documentation
# → Validates test coverage
```

### Example 3: API Changes

```bash
# API modification
# ... update API endpoint ...

# Automatic API documentation update
/sdd.docs-sync --api-docs --auto

# Validation
/sdd.code-validate --scope modified --update-docs

# Commit
git add .
git commit -m "feat: enhance user API with pagination"
# → Updates OpenAPI/Swagger specs
# → Generates new API documentation
# → Validates breaking changes
```

## 📊 Validation Reports

### Code Quality Report Example

```
✅ Code validation completed!

📊 Validation Summary:
- Files checked: 12
- Issues found: 3
- Auto-fixed: 3
- Documentation updated: 2
- Test coverage: 87%

🔧 Issues Resolved:
- src/components/UserProfile.tsx: Added missing JSDoc comments
- src/api/users.ts: Fixed TypeScript strict mode issues
- README.md: Updated installation instructions

📚 Documentation Updated:
- docs/api/users.md: Added new endpoint documentation
- README.md: Added new feature description

✅ All quality gates passed
```

### Git Hook Output Example

```
🔍 Running SDD pre-commit validation...

📝 Validating staged files...
✅ Code validation passed (2 files)
✅ Documentation synchronized
✅ Formatting applied
✅ Tests passing (coverage: 85%)

📚 Documentation updates:
- API docs: 1 update
- README: 1 update

✅ Pre-commit validation passed
```

## 🛠️ Configuration Examples

### Project Quality Configuration

```json
// .sdd/code-validate.json
{
  "validation": {
    "typescript": {
      "strict": true,
      "noImplicitAny": true,
      "noUnusedLocals": true
    },
    "testing": {
      "minCoverage": 80,
      "requiredTests": ["unit", "integration"]
    },
    "security": {
      "scanDependencies": true,
      "checkSecrets": true,
      "noEval": true,
      "noInlineScripts": true
    },
    "performance": {
      "maxBundleSize": "500KB",
      "checkLighthouse": true,
      "noConsoleLog": true
    }
  }
}
```

### Git Hooks Configuration

```json
// .sdd/hooks.json
{
  "preCommit": {
    "enabled": true,
    "validationLevel": "normal",
    "autoFix": true,
    "updateDocs": true,
    "runTests": "staged",
    "maxFileSize": "10MB"
  },
  "prePush": {
    "enabled": true,
    "validationLevel": "strict",
    "runTests": "full",
    "coverageThreshold": 80,
    "securityScan": true,
    "performanceCheck": true
  }
}
```

## 🎯 Best Practices

### For Individual Developers

1. **Setup Early**: Configure validation hooks before starting development
2. **Iterative Validation**: Commit frequently to catch issues early
3. **Review Changes**: Check auto-generated documentation for accuracy
4. **Test Coverage**: Maintain test coverage above 80%

### For Development Teams

1. **Consistent Standards**: Share validation configuration files
2. **Code Reviews**: Include validation in pull request process
3. **Documentation**: Keep documentation in sync with code
4. **Quality Gates**: Enforce validation before merges

### For Production Projects

1. **Strict Validation**: Use strict validation level
2. **Comprehensive Testing**: Include unit, integration, and E2E tests
3. **Security Focus**: Regular security scans and dependency updates
4. **Performance Monitoring**: Continuous performance validation

## 🔍 Troubleshooting

### Common Issues

#### Validation Fails
```bash
# Check specific issues
/sdd.code-validate --scope staged --verbose

# Fix common issues
/sdd.code-validate --scope staged --fix

# Update documentation
/sdd.docs-sync --auto
```

#### Hook Issues
```bash
# Check hook status
/sdd.setup-hooks --status

# Reinstall hooks
/sdd.setup-hooks --hooks all --force

# Test hooks manually
./.git/hooks/pre-commit
```

#### Documentation Out of Sync
```bash
# Full documentation sync
/sdd.docs-sync --all --auto

# Check what would be updated
/sdd.docs-sync --auto --dry-run

# Specific documentation type
/sdd.docs-sync --api-docs --auto
```

## 📈 Quality Metrics

### Metrics Tracked

- **Code Quality**: Linting errors, type safety, complexity
- **Test Coverage**: Unit, integration, E2E coverage percentages
- **Documentation**: API docs completeness, README updates
- **Security**: Vulnerabilities, dependency issues
- **Performance**: Bundle size, load times, Lighthouse scores

### Quality Score Calculation

```
Overall Quality Score = (
  Code Quality × 30% +
  Test Coverage × 25% +
  Documentation × 20% +
  Security × 15% +
  Performance × 10%
)
```

### Example Score Breakdown

- Code Quality: 95% × 30% = 28.5
- Test Coverage: 87% × 25% = 21.75
- Documentation: 92% × 20% = 18.4
- Security: 100% × 15% = 15.0
- Performance: 88% × 10% = 8.8

**Overall Quality Score: 92.45% ✅**

This comprehensive validation system ensures that every code change maintains high quality standards, keeps documentation synchronized, and prevents technical debt accumulation.