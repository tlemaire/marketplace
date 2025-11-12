# Simple Project Example

A basic example of SmartCommit usage with a single package.json configuration file.

## Project Structure

```
simple/
├── package.json
├── CHANGELOG.md
├── src/
│   ├── app.js
│   └── utils.js
└── README.md
```

## Initial Setup

### package.json
```json
{
  "name": "simple-project",
  "version": "1.0.0",
  "description": "A simple project demonstrating SmartCommit",
  "main": "src/app.js",
  "scripts": {
    "start": "node src/app.js",
    "test": "jest"
  },
  "keywords": ["simple", "example", "smartcommit"],
  "author": "SmartCommit Team",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "jest": "^29.0.0"
  }
}
```

### smartcommit.json
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
    "files": ["package.json"],
    "scheme": "semantic"
  }
}
```

## Usage Examples

### Example 1: Adding a New Feature

#### Before Changes
```javascript
// src/app.js
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
```

#### Make Changes
```javascript
// src/app.js (after changes)
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// New feature: API endpoint
app.get('/api/users', (req, res) => {
  res.json([
    { id: 1, name: 'John Doe' },
    { id: 2, name: 'Jane Smith' }
  ]);
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
```

#### Generate Smart Commit
```bash
# Stage changes
git add src/app.js

# Generate smart commit
/smartcommit.commit
```

**Output:**
```
🔍 Analyzing staged changes...
📝 Detected 1 file modified: src/app.js
🎯 Change categorized as: Feature (API endpoint addition)

💡 Generated commit message:
feat(api): Add user list endpoint returning JSON data

- Implements GET /api/users endpoint
- Returns array of user objects with id and name
- Provides basic API functionality for frontend integration

📋 CHANGELOG.md will be updated on next commit
📦 Version bump suggestion: minor (1.0.0 → 1.1.0)
✅ Commit message ready, use: git commit -m "feat(api): Add user list endpoint returning JSON data"
```

#### Execute Commit
```bash
git commit -m "feat(api): Add user list endpoint returning JSON data"

# Update changelog
/smartcommit.changelog

# Bump version
/smartcommit.version --minor
```

**After Changes:**
- **package.json**: version updated to "1.1.0"
- **CHANGELOG.md**: new entry added for version 1.1.0

### Example 2: Fixing a Bug

#### Bug Scenario
```javascript
// src/utils.js (buggy code)
function formatDate(date) {
  return date.toISOString().split('T')[0]; // Bug: timezone issues
}

module.exports = { formatDate };
```

#### Fix Implementation
```javascript
// src/utils.js (fixed code)
function formatDate(date) {
  const offset = date.getTimezoneOffset();
  const localDate = new Date(date.getTime() - (offset * 60 * 1000));
  return localDate.toISOString().split('T')[0];
}

module.exports = { formatDate };
```

#### Generate Smart Commit
```bash
git add src/utils.js
/smartcommit.commit
```

**Output:**
```
🔍 Analyzing staged changes...
📝 Detected 1 file modified: src/utils.js
🎯 Change categorized as: Bug Fix (timezone handling)

💡 Generated commit message:
fix(utils): Resolve timezone offset in date formatting

- Fixes timezone conversion for local date formatting
- Adjusts for browser timezone offset differences
- Ensures consistent date output across timezones

📋 CHANGELOG.md will be updated on next commit
📦 Version bump suggestion: patch (1.1.0 → 1.1.1)
✅ Commit message ready
```

#### Execute Fix
```bash
git commit -m "fix(utils): Resolve timezone offset in date formatting"
/smartcommit.changelog
/smartcommit.version --patch
```

### Example 3: Documentation Update

#### Documentation Changes
Update README.md with new API documentation:
```markdown
## API Endpoints

### GET /api/users
Returns a list of users.

**Response:**
```json
[
  { "id": 1, "name": "John Doe" },
  { "id": 2, "name": "Jane Smith" }
]
```
```

#### Generate Smart Commit
```bash
git add README.md
/smartcommit.commit
```

**Output:**
```
🔍 Analyzing staged changes...
📝 Detected 1 file modified: README.md
🎯 Change categorized as: Documentation

💡 Generated commit message:
docs(readme): Add API documentation for users endpoint

- Documents GET /api/users endpoint with response format
- Includes JSON response example
- Provides clear API usage instructions

📋 No changelog update needed for documentation-only changes
📦 No version bump needed for documentation changes
✅ Commit message ready
```

## Generated Files

### CHANGELOG.md (After Multiple Commits)
```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [1.1.1] - 2024-01-17

### Fixed
- Resolve timezone offset in date formatting (fix(utils): timezone handling)
- Ensures consistent date output across different timezones

## [1.1.0] - 2024-01-16

### Added
- User list API endpoint returning JSON data (feat(api): users endpoint)
- Implements GET /api/users with user object array
- Provides basic API functionality for frontend integration

## [1.0.0] - 2024-01-15

### Added
- Initial project setup with Express.js
- Basic Hello World application
- Project structure and configuration
```

### package.json (Version Evolution)
```json
{
  "name": "simple-project",
  "version": "1.1.1",
  "description": "A simple project demonstrating SmartCommit",
  "main": "src/app.js",
  "scripts": {
    "start": "node src/app.js",
    "test": "jest"
  },
  "keywords": ["simple", "example", "smartcommit"],
  "author": "SmartCommit Team",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "jest": "^29.0.0"
  }
}
```

## Advanced Usage

### Dry Run Mode
```bash
/smartcommit.commit --dry-run
```
Shows what would be generated without actually committing.

### Custom Commit Types
```json
{
  "commitTypes": {
    "feat": "New Features",
    "improve": "Code Improvements",
    "fix": "Bug Fixes",
    "docs": "Documentation",
    "test": "Testing",
    "perf": "Performance",
    "refactor": "Code Refactoring",
    "chore": "Maintenance"
  }
}
```

### Custom Version Files
```json
{
  "versioning": {
    "customFiles": [
      {
        "path": "VERSION.txt",
        "pattern": ".*",
        "replacement": "{version}"
      }
    ]
  }
}
```

## Best Practices Demonstrated

1. **Consistent Commit Messages**: All commits follow conventional format
2. **Automatic Changelog**: CHANGELOG.md updated with each release
3. **Semantic Versioning**: Version numbers follow semantic versioning rules
4. **Clear Change Categories**: Changes properly categorized as features, fixes, or documentation
5. **Descriptive Messages**: Commit messages clearly explain what and why

## Integration with Git Hooks

Create `.git/hooks/prepare-commit-msg`:
```bash
#!/bin/sh
smartcommit --prepare-msg "$1"
```

This will automatically generate commit messages when you run `git commit` without a message.

## Key Takeaways

- SmartCommit analyzes staged changes to generate appropriate commit messages
- Changelog is maintained automatically with each meaningful change
- Version bumping follows semantic versioning based on change types
- Configuration is simple and minimal for basic projects
- Integration with existing git workflows is seamless