---
description: Automatic documentation synchronization and updates
shortcut: sdd.docs-sync
shortcut_example: "/sdd.docs-sync --auto --api-docs --readme"
parameters:
  - name: scope
    type: string
    required: false
    description: Documentation sync scope (all, api, readme, changelog, code-comments)
    examples:
      - all
      - api
      - readme
      - changelog
      - code-comments
  - name: auto
    type: boolean
    required: false
    description: Auto-detect and update documentation
    examples:
      - true
      - false
  - name: api-docs
    type: boolean
    required: false
    description: Update API documentation
    examples:
      - true
      - false
  - name: readme
    type: boolean
    required: false
    description: Update README files
    examples:
      - true
      - false
  - name: changelog
    type: boolean
    required: false
    description: Update changelog with new features
    examples:
      - true
      - false
  - name: dry-run
    type: boolean
    required: false
    description: Show what would be updated without making changes
    examples:
      - true
      - false
examples:
  - description: Full documentation sync with auto-detection
    command: /sdd.docs-sync --auto --all
  - description: Update only API documentation
    command: /sdd.docs-sync --api-docs --auto
  - description: Sync documentation after feature implementation
    command: /sdd.docs-sync --readme --changelog
  - description: Preview documentation updates
    command: /sdd.docs-sync --auto --dry-run
---

# SDD Documentation Synchronization

**Purpose**: Automatic documentation synchronization to ensure documentation always reflects current code state.

## How It Works

This command analyzes code changes and automatically updates relevant documentation to prevent drift between code and documentation.

## Documentation Types

### 1. API Documentation
- **TypeScript**: Generate JSDoc from interfaces and types
- **REST APIs**: Update OpenAPI/Swagger specifications
- **GraphQL**: Update schema documentation
- **SDK Libraries**: Update method documentation

### 2. README Updates
- **Installation**: Update dependencies and setup instructions
- **Usage**: Add new usage examples and features
- **Configuration**: Document new configuration options
- **Contributing**: Update development setup guidelines

### 3. Changelog Management
- **Features**: Add new feature descriptions
- **Breaking Changes**: Document breaking changes
- **Bug Fixes**: Document resolved issues
- **Performance**: Note performance improvements

### 4. Code Comments
- **Function Documentation**: Add missing JSDoc comments
- **Class Documentation**: Generate class-level documentation
- **Complex Logic**: Add explanatory comments
- **TODO/FIXME**: Track known issues and improvements

## Auto-Detection Features

### Feature Detection
```typescript
// Detected: New User type
interface User {
  id: string;
  name: string;
  email: string;
  createdAt: Date;
}

// Auto-generated JSDoc:
/**
 * Represents a user in the system
 * @interface User
 */
```

### API Endpoint Detection
```typescript
// Detected: New API endpoint
app.post('/api/users', async (req, res) => {
  // ... implementation
});

// Auto-generated API docs:
/**
 * POST /api/users
 * Creates a new user in the system
 */
```

### Component Detection
```tsx
// Detected: New React component
interface UserProfileProps {
  user: User;
  onEdit?: (user: User) => void;
}

export const UserProfile: React.FC<UserProfileProps> = ({ user, onEdit }) => {
  return <div>{user.name}</div>;
};

// Auto-generated documentation:
/**
 * UserProfile component
 * @component
 * @param {User} user - The user object to display
 * @param {function} [onEdit] - Optional edit handler
 */
```

## Integration Examples

### After Code Changes
```bash
# After implementing new feature
/sdd.code-validate --fix --update-docs
/sdd.docs-sync --auto --readme --changelog

# After API changes
/sdd.docs-sync --api-docs --auto

# After refactoring
/sdd.docs-sync --code-comments --auto
```

### Pre-commit Workflow
```bash
#!/bin/sh
# Update documentation before commit
/sdd.docs-sync --auto --dry-run
git add docs/ README.md CHANGELOG.md
```

### Release Preparation
```bash
# Before release
/sdd.docs-sync --all --auto
/sdd.code-validate --scope all --strict
```

## Documentation Templates

### API Documentation Template
```markdown
# API Documentation

## Authentication
All API requests require authentication via Bearer token.

## Endpoints

### Users API

#### Create User
```http
POST /api/users
Content-Type: application/json
Authorization: Bearer {token}

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

#### Get User
```http
GET /api/users/{id}
Authorization: Bearer {token}
```
```

### README Template Updates
```markdown
# Project Name

## Installation
\`\`\`bash
npm install
npm run dev
\`\`\`

## Usage
\`\`\`typescript
import { UserService } from './services/user';

const user = await UserService.create({
  name: 'John Doe',
  email: 'john@example.com'
});
\`\`\`

## Features
- ✅ User authentication
- ✅ Data persistence
- ✅ API validation
- ✅ Error handling
```

### Changelog Template
```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- User authentication system
- API validation middleware
- Database connection pooling

### Changed
- Updated TypeScript to v5.0
- Improved error handling
- Enhanced logging system

### Fixed
- Memory leak in user service
- CORS configuration issue
- Type validation errors
```

## Configuration

### Documentation Sync Configuration (.sdd/docs-sync.json)
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
    "includeBadges": true
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
  }
}
```

## Output Examples

### Successful Sync
```
✅ Documentation synchronization completed!

📊 Sync Summary:
- API documentation: 3 updates
- README files: 2 updates
- Changelog: 5 new entries
- Code comments: 12 additions

🔄 Updated Files:
- docs/api/users.md
- README.md
- CHANGELOG.md
- src/services/user.ts

📋 Next Steps:
- Review updated documentation
- Commit documentation changes
- Consider running full test suite
```

### Dry Run Preview
```
🔍 Documentation sync preview (dry-run):

📝 Would update:
- docs/api/users.md: Add new endpoints
- README.md: Add feature list
- CHANGELOG.md: Add new features
- src/components/User.tsx: Add JSDoc comments

📊 Statistics:
- API docs: 2 additions
- README: 1 update
- Changelog: 3 entries
- Comments: 8 additions

💡 Run without --dry-run to apply changes
```

### No Changes Needed
```
✅ Documentation is already up to date!

📊 Current State:
- API documentation: Complete
- README files: Current
- Changelog: Updated
- Code comments: Comprehensive

🎯 Documentation health score: 100%
```

## Integration with Development Workflow

### Git Hooks Integration
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "📚 Syncing documentation..."
/sdd.docs-sync --auto --dry-run

if [ $? -eq 0 ]; then
  echo "✅ Documentation synchronized"
  git add docs/ README.md CHANGELOG.md
else
  echo "❌ Documentation sync failed"
  exit 1
fi
```

### IDE Integration
```json
// .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Sync Documentation",
      "type": "shell",
      "command": "/sdd.docs-sync",
      "args": ["--auto", "--all"],
      "group": "build"
    }
  ]
}
```

## Best Practices

### For Active Development
1. **Frequent syncs**: Run after feature completion
2. **Auto-detection**: Use `--auto` for intelligent updates
3. **Review changes**: Check auto-generated content
4. **Version control**: Commit documentation with code

### For Team Projects
1. **Consistent format**: Share documentation templates
2. **Automated updates**: Use pre-commit hooks
3. **Code reviews**: Include documentation in reviews
4. **Style guides**: Maintain consistent documentation style

### For API Projects
1. **Version management**: Document API versions clearly
2. **Examples**: Include practical usage examples
3. **Error handling**: Document error responses
4. **Authentication**: Document auth requirements

This system ensures that documentation never becomes stale and automatically reflects the current state of the codebase, reducing maintenance overhead and improving developer experience.