---
description: Manage semantic versioning across multiple configuration formats
shortcut: smartcommit.version
---

# Smart Version Command

Manage semantic versioning across multiple configuration formats with automatic detection, updating, and validation.

## What to do:

1. **Detect project configuration files**:
   - Search for version files in project root and subdirectories
   - Identify file formats: JSON, TOML, YAML, XML, INI
   - Parse current version numbers from each file
   - Validate version format consistency

2. **Analyze version patterns**:
   - Check semantic versioning compliance (MAJOR.MINOR.PATCH)
   - Detect pre-release identifiers (alpha, beta, rc)
   - Identify build metadata and custom formats
   - Flag version inconsistencies across files

3. **Calculate version bump**:
   - Analyze git commit history for change types
   - Detect breaking changes and major modifications
   - Identify new features and improvements
   - Count bug fixes and patches

4. **Update version files**:
   - Apply version changes to all detected files
   - Maintain proper file formatting and structure
   - Preserve comments and existing configuration
   - Handle different syntax requirements

5. **Validate changes**:
   - Verify all files updated successfully
   - Check version consistency across project
   - Validate file syntax and structure
   - Report any issues or conflicts

## Supported Configuration Files:

### JavaScript/Node.js
```json
// package.json
{
  "name": "my-project",
  "version": "1.2.3",
  "dependencies": {
    "other-package": "^1.0.0"
  }
}
```

### Python/Poetry
```toml
# pyproject.toml
[tool.poetry]
name = "my-project"
version = "1.2.3"
description = "My project description"

[tool.poetry.dependencies]
python = "^3.8"
requests = "^2.28.0"
```

### Rust/Cargo
```toml
# Cargo.toml
[package]
name = "my-project"
version = "1.2.3"
edition = "2021"

[dependencies]
serde = "1.0"
```

### PHP/Composer
```json
// composer.json
{
  "name": "my/project",
  "version": "1.2.3",
  "require": {
    "php": "^8.0"
  }
}
```

### Dart/Flutter
```yaml
# pubspec.yaml
name: my_project
version: 1.2.3
description: My project description

dependencies:
  flutter:
    sdk: flutter
```

### Ruby/Gem
```ruby
# my-project.gemspec
Gem::Specification.new do |spec|
  spec.name          = "my-project"
  spec.version       = "1.2.3"
  spec.authors       = ["Author Name"]
end
```

### Java/Maven
```xml
<!-- pom.xml -->
<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example</groupId>
  <artifactId>my-project</artifactId>
  <version>1.2.3</version>
</project>
```

## Usage Examples:

### Show Current Version
```bash
# Display current version across all files
/smartcommit.version

# Show version for specific file
/smartcommit.version --file=package.json

# Check version consistency
/smartcommit.version --check
```

### Bump Versions
```bash
# Bump patch version (1.2.3 → 1.2.4)
/smartcommit.version --patch

# Bump minor version (1.2.3 → 1.3.0)
/smartcommit.version --minor

# Bump major version (1.2.3 → 2.0.0)
/smartcommit.version --major

# Auto-detect version bump based on commits
/smartcommit.version --auto
```

### Set Specific Version
```bash
# Set exact version
/smartcommit.version --set=1.2.3

# Set pre-release version
/smartcommit.version --set=1.2.3-beta.1

# Set version with build metadata
/smartcommit.version --set=1.2.3+build.123
```

### Pre-release Management
```bash
# Create alpha release
/smartcommit.version --alpha

# Create beta release
/smartcommit.version --beta

# Create release candidate
/smartcommit.version --rc

# Promote to stable release
/smartcommit.version --stable
```

## Configuration:

### Version Configuration (smartcommit.json)
```json
{
  "version": {
    "scheme": "semantic",
    "files": [
      "package.json",
      "pyproject.toml",
      "Cargo.toml",
      "composer.json",
      "pubspec.yaml"
    ],
    "autoDetect": true,
    "validateConsistency": true,
    "preReleaseTags": ["alpha", "beta", "rc"],
    "buildMetadata": true
  },
  "bumping": {
    "majorKeywords": ["BREAKING", "MAJOR", "breaking change"],
    "minorKeywords": ["feat", "feature", "new"],
    "patchKeywords": ["fix", "bugfix", "patch"],
    "noneKeywords": ["docs", "test", "chore", "config"]
  },
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

### Custom Version Patterns
```json
{
  "customFiles": [
    {
      "path": "src/Constants.java",
      "pattern": "String VERSION = \"(.+)\";",
      "replacement": "String VERSION = \"{version}\";",
      "encoding": "utf-8"
    },
    {
      "path": "version.txt",
      "pattern": ".*",
      "replacement": "{version}"
    }
  ]
}
```

## Advanced Features:

### Semantic Version Analysis
```bash
🔍 Analyzing commit history for version bump...
📊 Commit breakdown since last release:
├── Breaking changes: 1 (API modification)
├── Features: 3 (auth, dashboard, export)
├── Improvements: 2 (performance, UI)
└── Bug fixes: 1 (validation)

💡 Recommended version bump: 2.0.0 (major)
🚨 Breaking change detected in API endpoints
📝 Files to update: package.json, pyproject.toml, Cargo.toml
```

### Pre-release Workflow
```bash
# Start development cycle
/smartcommit.version --alpha    # 1.2.3 → 1.3.0-alpha.1
# Continue development
/smartcommit.version --alpha    # 1.3.0-alpha.1 → 1.3.0-alpha.2

# Promote to beta
/smartcommit.version --beta     # 1.3.0-alpha.2 → 1.3.0-beta.1

# Release candidate
/smartcommit.version --rc       # 1.3.0-beta.1 → 1.3.0-rc.1

# Final release
/smartcommit.version --stable   # 1.3.0-rc.1 → 1.3.0
```

### Custom Version Schemes
```bash
# Calendar versioning (CalVer)
/smartcommit.version --scheme=calver --set=2024.01.15

# Date-based versioning
/smartcommit.version --scheme=date --set=20240115

# Sequential versioning
/smartcommit.version --scheme=sequential --set=42

# Custom format
/smartcommit.version --scheme=custom --format="v{major}.{minor}.{patch}"
```

## Output Examples:

### Version Check
```bash
📋 Project Version Analysis
├── package.json: 1.2.3 ✅
├── pyproject.toml: 1.2.3 ✅
├── Cargo.toml: 1.2.3 ✅
└── pubspec.yaml: 1.2.4 ❌

⚠️  Version inconsistency detected!
💡 Expected version: 1.2.3
📝 Fix with: /smartcommit.version --set=1.2.3
```

### Version Bump
```bash
🚀 Bumping patch version: 1.2.3 → 1.2.4

📝 Updating files:
├── package.json ✅
├── pyproject.toml ✅
├── Cargo.toml ✅
└── src/version.py ✅

✅ Version bump completed successfully
💡 Commit suggestion: "chore: Bump version to 1.2.4"
```

### Auto Detection
```bash
🔍 Auto-detecting version bump...
📊 Analysis of 12 commits since v1.2.0:
├── 1 breaking change detected
├── 4 features added
├── 3 improvements made
└── 2 bug fixes resolved

💡 Recommended bump: major version (2.0.0)
🚨 Breaking change: API endpoint modification in src/api/users.py
📝 Proceed with bump? [y/N]
```

## Integration Examples:

### CI/CD Pipeline
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
      - name: Update versions
        run: |
          # Extract version from tag
          VERSION=${GITHUB_REF#refs/tags/v}
          smartcommit.version --set=$VERSION
      - name: Build and release
        run: |
          # Build process
          npm run build
          # Release to registry
          npm publish
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit
# Check version consistency before commit
if ! smartcommit.version --check; then
    echo "❌ Version inconsistency detected"
    echo "💡 Run: smartcommit.version --set=<version>"
    exit 1
fi
```

## Error Handling:

### Common Issues
```bash
❌ No version files found
💡 Supported files: package.json, pyproject.toml, Cargo.toml
🔍 Create one of these files or specify custom files

⚠️  Invalid version format detected
📝 Expected: semantic version (1.2.3)
💡 Current: "1.2" (incomplete)

❌ Version mismatch across files
📋 package.json: 1.2.3
📋 pyproject.toml: 1.2.4
💡 Fix with: smartcommit.version --set=1.2.3
```

### Recovery Options
```bash
# Reset all versions to specific value
/smartcommit.version --reset --to=1.2.3

# Sync to primary file (package.json)
/smartcommit.version --sync --from=package.json

# Interactive version fix
/smartcommit.version --interactive
```

## Best Practices:

### Version Management
- Use semantic versioning consistently
- Update all version files together
- Tag releases in git
- Document breaking changes clearly

### Team Collaboration
- Establish version bumping rules
- Use automated version management
- Communicate version changes
- Maintain changelog consistency

### Release Process
- Test version updates thoroughly
- Validate all configuration files
- Create git tags for releases
- Update documentation

Focus on providing comprehensive version management that supports multiple configuration formats, maintains consistency across projects, and integrates seamlessly with development and release workflows.