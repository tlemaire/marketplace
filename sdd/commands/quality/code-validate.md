---
description: Comprehensive code validation with automatic documentation updates
shortcut: sdd.code-validate
shortcut_example: "/sdd.code-validate --fix --update-docs"
parameters:
  - name: scope
    type: string
    required: false
    description: Validation scope (all, staged, modified, file)
    examples:
      - all
      - staged
      - modified
      - file
  - name: file
    type: string
    required: false
    description: Specific file to validate (when scope=file)
    examples:
      - src/components/User.tsx
      - tests/user.test.js
      - docs/api.md
  - name: fix
    type: boolean
    required: false
    description: Automatically fix common issues
    examples:
      - true
      - false
  - name: update-docs
    type: boolean
    required: false
    description: Update documentation automatically
    examples:
      - true
      - false
  - name: strict
    type: boolean
    required: false
    description: Strict validation mode (fail on any issue)
    examples:
      - true
      - false
examples:
  - description: Validate staged changes with auto-fix and doc updates
    command: /sdd.code-validate --scope staged --fix --update-docs
  - description: Validate specific file
    command: /sdd.code-validate --scope file --file src/components/User.tsx
  - description: Strict validation of all changes
    command: /sdd.code-validate --scope all --strict
  - description: Quick validation without fixes
    command: /sdd.code-validate --scope modified
---

# SDD Code Validation

**Purpose**: Comprehensive code validation with automatic documentation updates and quality enforcement for every code change.

## How It Works

This command implements a multi-layered validation system that:
- **Code Quality**: Linting, formatting, type checking, security scanning
- **Testing**: Unit test validation, coverage requirements, integration testing
- **Documentation**: Auto-updates for API docs, READMEs, and technical documentation
- **Performance**: Code complexity analysis, performance impact assessment
- **Security**: Security vulnerability scanning and best practices validation

## Validation Scope Options

### --scope all
Validates all code files in the project:
- Complete project analysis
- Full documentation update
- Comprehensive test validation

### --scope staged (Recommended for Git workflow)
Validates only staged changes:
- Git-staged files analysis
- Incremental documentation updates
- Focused testing on changed components

### --scope modified
Validates all modified files:
- Changed files since last commit
- Documentation sync for modified APIs
- Targeted testing recommendations

### --scope file
Validates specific file:
- Single file comprehensive analysis
- Documentation updates for specific changes
- Isolated testing validation

## Validation Layers

### 1. Code Quality Validation
```bash
# Static Analysis
- ESLint/Prettier formatting validation
- TypeScript type checking
- Code complexity analysis
- Security vulnerability scanning
- Performance bottleneck detection
```

### 2. Testing Validation
```bash
# Test Requirements
- Unit test coverage (minimum 80%)
- Integration test validation
- E2E test requirements
- Test file naming conventions
- Test quality assessment
```

### 3. Documentation Validation
```bash
# Documentation Requirements
- API documentation completeness
- README updates for new features
- Code comments validation
- Changelog updates
- Technical documentation sync
```

### 4. SDD Compliance Validation
```bash
# SDD Methodology
- Feature specification alignment
- Quality checklist completion
- Testing strategy validation
- Architecture compliance
```

## Automatic Documentation Updates

### When --update-docs is enabled:

#### API Documentation
- **TypeScript**: Auto-generate JSDoc from types
- **REST APIs**: Update OpenAPI/Swagger specs
- **GraphQL**: Update schema documentation
- **Components**: Update prop documentation

#### README Updates
- **New Features**: Add feature descriptions
- **Installation**: Update setup instructions
- **Usage**: Add new usage examples
- **Configuration**: Document new config options

#### Technical Documentation
- **Architecture**: Update system diagrams
- **APIs**: Refresh endpoint documentation
- **Database**: Update schema documentation
- **Deployment**: Update deployment guides

## Code Quality Standards

### Required Standards (Must Pass)
```typescript
// ✅ TypeScript
type User = {
  id: string;
  name: string;
  email: string;
};

// ✅ Proper Error Handling
try {
  const result = await apiCall();
  return result;
} catch (error) {
  logger.error('API call failed', error);
  throw new Error('Operation failed');
}

// ✅ Test Coverage
describe('UserService', () => {
  it('should create user with valid data', async () => {
    const user = await UserService.create(validUserData);
    expect(user.email).toBe(validUserData.email);
  });
});
```

### Prohibited Patterns (Will Fail)
```typescript
// ❌ Any Types
const data: any = apiResponse; // Fail

// ❌ Console.log in production
console.log(user); // Fail - use logger

// ❌ Unhandled promises
apiCall().then(result => processResult(result)); // Fail

// ❌ Missing error handling
async function getUser(id: string) {
  return await db.user.findUnique(id); // Fail - no error handling
}
```

## Integration Examples

### Git Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🔍 Running SDD Code Validation..."

# Validate staged changes
/sdd.code-validate --scope staged --fix --update-docs

if [ $? -eq 0 ]; then
  echo "✅ Code validation passed"
  exit 0
else
  echo "❌ Code validation failed"
  echo "Fix issues before committing"
  exit 1
fi
```

### CI/CD Pipeline
```yaml
# .github/workflows/validate.yml
name: Code Validation

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm ci
      - name: SDD Code Validation
        run: /sdd.code-validate --scope all --strict
```

### Development Workflow
```bash
# Before committing
/sdd.code-validate --scope staged --fix --update-docs
git add .
git commit -m "feat: add user authentication"

# Before pushing
/sdd.code-validate --scope modified --strict
git push origin feature-branch
```

## Output Examples

### Successful Validation
```
✅ Code validation completed successfully!

📊 Validation Summary:
- Files checked: 5
- Issues found: 0
- Auto-fixed: 0
- Documentation updated: 0
- Test coverage: 92%

🔍 Quality Metrics:
- Code complexity: Low
- Security: No vulnerabilities
- Performance: Optimal
- Documentation: Complete

📋 Next Steps:
- Ready for commit
- Consider running full test suite
```

### Issues Found with Auto-fix
```
⚠️ Code validation found fixable issues:

📁 Files analyzed: 3
🔧 Auto-fixed issues: 4
📄 Documentation updated: 2
✅ All issues resolved

Fixed:
- src/components/User.tsx: Added missing JSDoc comments
- src/api/auth.ts: Fixed TypeScript types
- README.md: Updated installation instructions
- docs/api.md: Added new endpoint documentation

📋 Commit your changes:
git add .
git commit -m "fix: resolve code validation issues"
```

### Critical Issues Found
```
❌ Code validation failed - Critical issues detected:

📁 Files analyzed: 4
❌ Critical issues: 2
⚠️ Warnings: 3

Critical Issues:
- src/auth/service.ts: Missing error handling (line 45)
- tests/auth.test.js: Test coverage below 80% (65%)

Fix required before proceeding:
1. Add error handling to auth service
2. Add unit tests for edge cases

💡 Run with --fix to auto-resolve non-critical issues
```

## Configuration

### Project Configuration (.sdd/code-validate.json)
```json
{
  "validation": {
    "typescript": {
      "strict": true,
      "noImplicitAny": true
    },
    "testing": {
      "minCoverage": 80,
      "requiredTests": ["unit", "integration"]
    },
    "documentation": {
      "autoUpdate": true,
      "apiDocs": true,
      "readmeUpdates": true
    },
    "security": {
      "scanDependencies": true,
      "checkSecrets": true
    }
  },
  "hooks": {
    "preCommit": true,
    "prePush": true,
    "continuousIntegration": true
  }
}
```

## Best Practices

### Before Each Commit
1. **Quick validation**: `/sdd.code-validate --scope staged`
2. **Auto-fix issues**: Add `--fix` flag
3. **Update docs**: Add `--update-docs` flag
4. **Review changes**: Check auto-generated documentation

### For Team Development
1. **Consistent standards**: Share configuration file
2. **Pre-commit hooks**: Enforce validation automatically
3. **CI/CD integration**: Validate in pull requests
4. **Documentation sync**: Keep docs in sync with code

### For Large Projects
1. **Incremental validation**: Use `--scope staged`
2. **Performance focus**: Monitor validation time
3. **Parallel testing**: Run tests in parallel
4. **Documentation management**: Split large documentation

This system ensures that every code change maintains quality standards and automatically keeps documentation in sync, preventing drift between code and documentation.