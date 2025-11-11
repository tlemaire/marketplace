# NPM Publishing Guide

## 📦 Publishing to NPM

### Prerequisites
1. **NPM Account**: Create account at https://npmjs.com
2. **Package Name**: Already configured as `@claude-code/sdd-skill`
3. **Authentication**: `npm login`

### Publishing Steps

```bash
# Login to NPM
npm login

# Verify package info
npm pack --dry-run

# Publish to NPM
npm publish --access public

# Verify publication
npm view @claude-code/sdd-skill
```

### Package Configuration
The `package.json` is already configured with:
- **Name**: `@claude-code/sdd-skill`
- **Version**: `1.0.0` (follows semantic versioning)
- **Files**: Includes necessary files for distribution
- **Repository**: Points to GitHub repository
- **Keywords**: Relevant for discoverability

### Version Management

```bash
# Patch version (bug fixes)
npm version patch

# Minor version (new features)
npm version minor

# Major version (breaking changes)
npm version major

# Publish new version
npm publish
```

## 🏪 Alternative Distribution Methods

### GitHub Releases
- Users can download releases directly from GitHub
- Automatic updates via GitHub Actions
- No NPM account required

### Direct Installation
```bash
# Install from GitHub
npm install https://github.com/tlemaire/claude-code-sdd-skill.git

# Clone and install manually
git clone https://github.com/tlemaire/claude-code-sdd-skill.git
cd claude-code-sdd-skill
npm install
npm run install
```

## 📊 Analytics and Monitoring

### NPM Analytics
- Download statistics via npmjs.com
- Version usage tracking
- Dependency tree analysis

### GitHub Analytics
- Clone/traffic statistics
- Star and fork counts
- Issue and PR activity

---

After publishing, users can install your skill via:
```bash
npm install @claude-code/sdd-skill
npm run install
```