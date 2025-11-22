# Quality Validation Setup Template

> **Configure automated quality assurance and validation for your SDD project**

## Quick Setup Commands

### Basic Quality Setup (Recommended for most projects)
```bash
# Setup automatic quality enforcement
/sdd.setup-hooks --hooks pre-commit --validate-level normal

# Enable automatic documentation updates
/sdd.docs-sync --auto

# Cache popular libraries for offline development
/mcp.cache update --scope popular
```

### Enterprise Quality Setup (For production and team projects)
```bash
# Setup strict quality enforcement
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict

# Enable comprehensive documentation management
/sdd.docs-sync --auto

# Cache comprehensive library documentation
/mcp.cache update --scope comprehensive

# Initialize quality configuration
/sdd.code-validate --init-config
```

### Development-Only Setup (For experiments and prototypes)
```bash
# Setup lightweight validation
/sdd.setup-hooks --hooks pre-commit --validate-level lenient

# Basic documentation sync
/sdd.docs-sync --auto --dry-run

# Cache essential libraries only
/mcp.cache update --scope essential
```

## Configuration Files

### 1. Quality Validation Configuration
Create `.sdd/code-validate.json`:
```json
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
    },
    "documentation": {
      "requireJSDoc": true,
      "updateREADME": true,
      "generateAPI": true
    }
  },
  "hooks": {
    "preCommit": {
      "enabled": true,
      "autoFix": true,
      "updateDocs": true,
      "runTests": true
    },
    "prePush": {
      "enabled": true,
      "fullValidation": true,
      "coverageThreshold": 80
    }
  }
}
```

### 2. Git Hooks Configuration
Create `.sdd/hooks.json`:
```json
{
  "preCommit": {
    "enabled": true,
    "validationLevel": "normal",
    "autoFix": true,
    "updateDocs": true,
    "runTests": true,
    "maxFileSize": "10MB",
    "allowedFileTypes": [".ts", ".tsx", ".js", ".jsx", ".md", ".json"]
  },
  "prePush": {
    "enabled": true,
    "validationLevel": "normal",
    "runTests": "full",
    "coverageThreshold": 80,
    "securityScan": true,
    "performanceCheck": true,
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
    "console": true,
    "detailed": true
  }
}
```

### 3. Documentation Sync Configuration
Create `.sdd/docs-sync.json`:
```json
{
  "api": {
    "generateJSDoc": true,
    "updateOpenAPI": true,
    "includeExamples": true,
    "outputDir": "docs/api"
  },
  "readme": {
    "autoUpdateUsage": true,
    "updateInstallation": true,
    "addFeatureList": true,
    "includeBadges": true,
    "updateTableOfContents": true
  },
  "changelog": {
    "autoDetectFeatures": true,
    "groupByType": true,
    "includeVersionNumbers": true,
    "outputFile": "CHANGELOG.md"
  },
  "comments": {
    "generateForPublic": true,
    "includeExamples": true,
    "addParameterTypes": true,
    "skipGenerated": false
  },
  "sync": {
    "onCommit": true,
    "onPush": false,
    "onImplementation": true,
    "excludePatterns": ["node_modules", ".git", "dist"]
  }
}
```

### 4. MCP Cache Configuration
Create `.sdd/mcp-cache.json`:
```json
{
  "cache": {
    "maxSizeMB": 100,
    "retentionDays": 60,
    "autoCache": true,
    "updateFrequency": "weekly"
  },
  "libraries": {
    "popular": [
      "React", "TypeScript", "Node.js", "Express",
      "Next.js", "Tailwind CSS", "PostgreSQL"
    ],
    "essential": [
      "React", "TypeScript", "Node.js", "Express", "Next.js"
    ],
    "comprehensive": [
      "React", "TypeScript", "Node.js", "Express", "Next.js",
      "Vue.js", "Angular", "Tailwind CSS", "PostgreSQL", "MongoDB",
      "Redis", "Docker", "Jest", "Cypress", "GraphQL"
    ]
  },
  "update": {
    "onNewProject": true,
    "onLibraryMention": true,
    "weekly": true,
    "beforeOffline": true
  }
}
```

## Project Constitution Integration

Add to your project constitution (`.specify/memory/constitution.md`):

```markdown
## 🔒 Quality Standards

### Automated Validation
- **Pre-commit Quality**: All code changes validated before commit
- **Pre-push Validation**: Full project validation before push
- **Test Coverage**: Minimum 80% coverage (90% for production)
- **Documentation**: Automatic synchronization with code

### Security Requirements
- **Vulnerability Scanning**: Dependencies scanned for security issues
- **Secret Protection**: No secrets or credentials in code
- **Code Analysis**: Security best practices enforced
- **Compliance**: Industry security standards followed

### Performance Standards
- **Bundle Size**: Maximum 500KB for production builds
- **Load Time**: Under 3 seconds initial load
- **Lighthouse Score**: Minimum 90 in all categories
- **Console Logs**: No console.log in production builds
```

## Team Onboarding Checklist

### For New Team Members
```bash
# 1. Clone repository with all configuration
git clone <repository-url>
cd <project-name>

# 2. Setup quality validation
/sdd.setup-hooks --hooks all --validate-level normal

# 3. Install dependencies and run validation
npm install
/sdd.code-validate --scope all --fix

# 4. Verify setup with test commit
echo "// Test file" > test-setup.js
git add test-setup.js
git commit -m "test: verify quality setup"
rm test-setup.js
git add test-setup.js
git commit -m "chore: remove test file"
```

### Team Standards Document
Create `TEAM_STANDARDS.md`:
```markdown
# Team Development Standards

## Quality Workflow
1. **Setup**: Run `/sdd.setup-hooks` on first setup
2. **Development**: Normal Git workflow with automatic validation
3. **Validation**: Quality gates prevent issues
4. **Documentation**: Automatically updated

## Code Quality Requirements
- **TypeScript**: Strict mode enabled
- **Testing**: 80% minimum coverage
- **Documentation**: JSDoc for all public APIs
- **Security**: No vulnerable dependencies

## Commit Standards
- **Format**: Conventional commits required
- **Validation**: Automatic quality checks
- **Documentation**: Updated automatically
- **Testing**: Tests must pass before commit
```

## Verification Commands

### Test Your Setup
```bash
# Verify all configurations are working
/sdd.code-validate --scope all --strict
/sdd.docs-sync --all --dry-run
/sdd.setup-hooks --status
/mcp.cache list --stats
```

### Quality Score Check
```bash
# Get current quality score
/sdd.code-validate --scope all --score

# Expected output:
# Overall Quality Score: 95%
# Code Quality: 98% × 30% = 29.4
# Test Coverage: 92% × 25% = 23.0
# Documentation: 94% × 20% = 18.8
# Security: 100% × 15% = 15.0
# Performance: 88% × 10% = 8.8
```

## Troubleshooting

### Common Issues

#### Git Hooks Not Working
```bash
# Reinstall hooks
/sdd.setup-hooks --hooks all --force

# Check hook permissions
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/pre-push
```

#### Validation Failures
```bash
# Get detailed error information
/sdd.code-validate --scope all --verbose

# Fix common issues automatically
/sdd.code-validate --scope all --fix
```

#### Documentation Out of Sync
```bash
# Force documentation synchronization
/sdd.docs-sync --all --auto

# Check what would be updated
/sdd.docs-sync --all --dry-run
```

This template ensures every SDD project has enterprise-grade quality automation configured correctly from day one.