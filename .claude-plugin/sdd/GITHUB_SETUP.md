# GitHub Repository Setup Guide

## 🎯 Repository Configuration

### Repository Settings (https://github.com/tlemaire/claude-code-sdd-skill/settings)

#### **General**
- **Repository name**: `claude-code-sdd-skill`
- **Description**: `SDD (Spec-Driven Development) skill for Claude Code - Transform ideas into structured specifications and executable code`
- **Website**: `https://claude.com/claude-code`
- **Primary language**: `JavaScript`

#### **Features**
- ✅ **Issues** - Enable for bug reports and feature requests
- ✅ **Projects** - Optional for project management
- ✅ **Wiki** - Optional for extended documentation
- ✅ **Discussions** - Enable for community Q&A
- ✅ **Security advisories** - Enable for vulnerability reporting

#### **Merge button**
- **Allow merge commits**: ✅
- **Allow squash merging**: ✅
- **Allow rebase merging**: ❌ (preserves history better)

## 🏷️ **Topics/Tags**

Add these topics to improve discoverability:
```
claude-code
spec-driven-development
sdd
software-development
workflow
slash-commands
automation
productivity
development-tools
specifications
documentation
```

## 🔐 **Branch Protection Rules**

#### **Main Branch Protection**
Go to Settings → Branches → Add branch protection rule

**Branch name pattern**: `main`

**Require status checks to pass before merging**:
- ✅ Require branches to be up to date before merging
- ✅ Require status checks to pass before merging

**Require pull request reviews before merging**:
- ✅ Required approvals: 1
- ✅ Dismiss stale PR approvals when new commits are pushed
- ✅ Require review from CODEOWNERS
- ✅ Restrict dismissals to users with write access

**Other restrictions**:
- ✅ Require signed commits
- ❌ Limit pushes to users who have write access (optional)

## 📝 **Pull Request Template**

Create `.github/pull_request_template.md`:

```markdown
## 📋 Description
Brief description of changes and motivation.

## 🎯 Type of Change
- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## ✅ Testing
- [ ] Code follows project style guidelines
- [ ] Self-review of the code completed
- [ ] Code is commented appropriately
- [ ] Testing demonstrates functionality works
- [ ] Documentation updated if necessary

## 🔗 Related Issues
Closes #(issue number)

## 📸 Screenshots (if applicable)
Add screenshots to help explain your changes.
```

## 🐛 **Issue Templates**

Create `.github/ISSUE_TEMPLATE/bug_report.md`:

```markdown
---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

## 🐛 Bug Description
A clear and concise description of what the bug is.

## 🔄 Reproduction Steps
Steps to reproduce the behavior:
1. Run command '...'
2. With parameters '...'
3. See error

## 🎯 Expected Behavior
A clear and concise description of what you expected to happen.

## 📸 Screenshots
If applicable, add screenshots to help explain your problem.

## 💻 Environment
- OS: [e.g. macOS 13.0, Ubuntu 22.04]
- Claude Code version: [e.g. 2.0.37]
- Node.js version: [e.g. 18.17.0]
- SDD skill version: [e.g. 1.0.0]

## 📝 Additional Context
Add any other context about the problem here.
```

## 🚀 **Release Automation**

### **GitHub Actions Workflow**

Create `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install dependencies
        run: npm ci

      - name: Run tests
        run: npm test

      - name: Create Release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: ${{ github.ref }}
          release_name: Release ${{ github.ref }}
          draft: false
          prerelease: false
```

## 📊 **Repository Insights**

Enable these in Settings → Insights:
- **Traffic** - View traffic and clone statistics
- **Commits** - Commit activity and contributors
- **Code frequency** - Addition and deletion over time
- **Network** - Fork graph
- **Community** - Community profile metrics

## 🏆 **Community Profile**

Complete these items for a healthy community profile:
- ✅ Description filled out
- ✅ Website provided
- ✅ Topics added
- ✅ README.md present
- ✅ LICENSE present
- ✅ Contributing guidelines (CONTRIBUTING.md)
- ✅ Code of conduct
- ✅ Issue templates
- ✅ Pull request templates
- ✅ Recent releases
- ⏳ Stars (encourage users to star)
- ⏳ Forks
- ⏳ Pull requests enabled

## 🤖 **Automations**

Consider enabling:
- **Dependabot** - For automatic dependency updates
- **Code scanning** - For security vulnerability detection
- **Secret scanning** - For accidental secret commits
- **Automated link checker** - For validating documentation links

---

After completing these steps, your repository will be properly configured for:
- Professional development workflow
- Community contributions
- Automated releases
- Security and maintenance best practices
- Good visibility and discoverability