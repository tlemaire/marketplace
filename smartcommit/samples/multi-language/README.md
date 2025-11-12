# Multi-Language Project Example

Demonstrates SmartCommit's capability to manage versions across multiple configuration formats and programming languages.

## Project Structure

```
multi-language/
├── package.json              # Node.js/TypeScript configuration
├── pyproject.toml           # Python/Poetry configuration
├── Cargo.toml               # Rust configuration
├── smartcommit.json         # SmartCommit configuration
├── CHANGELOG.md             # Shared changelog
├── src/
│   ├── index.ts             # TypeScript entry point
│   ├── version.ts           # TypeScript version constant
│   └── lib.rs               # Rust library
├── python/
│   ├── multi_language_project/
│   │   ├── __init__.py      # Python version constant
│   │   └── main.py          # Python application
└── rust/
    └── src/
        ├── main.rs          # Rust binary
        └── lib.rs           # Rust library with version
```

## Configuration Files

### SmartCommit Configuration
The `smartcommit.json` file configures SmartCommit to handle multiple configuration formats:

```json
{
  "versioning": {
    "files": ["package.json", "pyproject.toml", "Cargo.toml"],
    "scheme": "semantic"
  },
  "customFiles": [
    {
      "path": "src/version.ts",
      "pattern": "export const VERSION = \"(.+)\";",
      "replacement": "export const VERSION = \"{version}\";"
    },
    {
      "path": "python/multi_language_project/__init__.py",
      "pattern": "__version__ = \"(.+)\"",
      "replacement": "__version__ = \"{version}\""
    },
    {
      "path": "rust/src/lib.rs",
      "pattern": "pub const VERSION: &str = \"(.+)\";",
      "replacement": "pub const VERSION: &str = \"{version}\";"
    }
  ]
}
```

## Usage Examples

### Example 1: Cross-Language Feature Implementation

#### TypeScript Implementation
```typescript
// src/user-service.ts
export interface User {
  id: number;
  name: string;
  email: string;
}

export class UserService {
  private users: User[] = [];

  async createUser(userData: Omit<User, 'id'>): Promise<User> {
    const user: User = {
      id: this.users.length + 1,
      ...userData
    };
    this.users.push(user);
    return user;
  }

  async getUser(id: number): Promise<User | null> {
    return this.users.find(user => user.id === id) || null;
  }
}
```

#### Python Implementation
```python
# python/multi_language_project/user_service.py
from typing import List, Optional
from pydantic import BaseModel

class User(BaseModel):
    id: int
    name: str
    email: str

class UserService:
    def __init__(self):
        self.users: List[User] = []

    async def create_user(self, user_data: dict) -> User:
        user = User(
            id=len(self.users) + 1,
            **user_data
        )
        self.users.append(user)
        return user

    async def get_user(self, user_id: int) -> Optional[User]:
        return next((user for user in self.users if user.id == user_id), None)
```

#### Rust Implementation
```rust
// rust/src/user_service.rs
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct User {
    pub id: u32,
    pub name: String,
    pub email: String,
}

pub struct UserService {
    users: HashMap<u32, User>,
    next_id: u32,
}

impl UserService {
    pub fn new() -> Self {
        Self {
            users: HashMap::new(),
            next_id: 1,
        }
    }

    pub fn create_user(&mut self, user_data: CreateUserRequest) -> User {
        let user = User {
            id: self.next_id,
            name: user_data.name,
            email: user_data.email,
        };
        self.users.insert(self.next_id, user.clone());
        self.next_id += 1;
        user
    }

    pub fn get_user(&self, user_id: u32) -> Option<&User> {
        self.users.get(&user_id)
    }
}

#[derive(Debug, Deserialize)]
pub struct CreateUserRequest {
    pub name: String,
    pub email: String,
}
```

#### Generate Smart Commit
```bash
# Stage all changes
git add src/user-service.ts python/multi_language_project/user_service.py rust/src/user_service.rs

# Generate smart commit
/smartcommit.commit
```

**Output:**
```
🔍 Analyzing staged changes...
📝 Detected 3 files modified across multiple languages
🎯 Change categorized as: Feature (User management system)

💡 Generated commit message:
feat(user-service): Add user management functionality across all languages

- TypeScript: Implement UserService class with CRUD operations
- Python: Add Pydantic-based user models and async operations
- Rust: Create UserService with HashMap storage and serialization
- Consistent API design across TypeScript, Python, and Rust implementations

📋 CHANGELOG.md will be updated on next commit
📦 Version bump suggestion: minor (1.0.0 → 1.1.0)
✅ Commit message ready
```

#### Execute Commit and Version Update
```bash
git commit -m "feat(user-service): Add user management functionality across all languages"
/smartcommit.changelog
/smartcommit.version --minor
```

### Example 2: Multi-Language Bug Fix

#### Bug Scenario: Email Validation Issue
All implementations have inconsistent email validation.

#### Fix Implementation
```typescript
// src/user-service.ts (fixed)
export class UserService {
  private validateEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  async createUser(userData: Omit<User, 'id'>): Promise<User> {
    if (!this.validateEmail(userData.email)) {
      throw new Error('Invalid email format');
    }
    // ... rest of implementation
  }
}
```

```python
# python/multi_language_project/user_service.py (fixed)
import re

class UserService:
    def validate_email(self, email: str) -> bool:
        pattern = r'^[^\s@]+@[^\s@]+\.[^\s@]+$'
        return bool(re.match(pattern, email))

    async def create_user(self, user_data: dict) -> User:
        if not self.validate_email(user_data['email']):
            raise ValueError('Invalid email format')
        # ... rest of implementation
```

```rust
// rust/src/user_service.rs (fixed)
impl UserService {
    fn validate_email(&self, email: &str) -> bool {
        email.contains('@') && email.contains('.') && email.len() > 5
    }

    pub fn create_user(&mut self, user_data: CreateUserRequest) -> Result<User, String> {
        if !self.validate_email(&user_data.email) {
            return Err("Invalid email format".to_string());
        }
        // ... rest of implementation
    }
}
```

#### Generate Smart Commit
```bash
git add src/user-service.ts python/multi_language_project/user_service.py rust/src/user_service.rs
/smartcommit.commit
```

**Output:**
```
🔍 Analyzing staged changes...
📝 Detected 3 files modified with consistent pattern
🎯 Change categorized as: Bug Fix (Email validation)

💡 Generated commit message:
fix(user-service): Standardize email validation across all language implementations

- TypeScript: Add regex-based email validation with proper error handling
- Python: Implement consistent email validation using regex patterns
- Rust: Add email validation method with consistent error messages
- Ensures email format consistency across TypeScript, Python, and Rust APIs

📋 CHANGELOG.md will be updated on next commit
📦 Version bump suggestion: patch (1.1.0 → 1.1.1)
✅ Commit message ready
```

## Version Synchronization Results

### After Version Bump (1.0.0 → 1.1.0)

#### package.json
```json
{
  "version": "1.1.0"
}
```

#### pyproject.toml
```toml
[tool.poetry]
version = "1.1.0"
```

#### Cargo.toml
```toml
[package]
version = "1.1.0"
```

#### src/version.ts
```typescript
export const VERSION = "1.1.0";
```

#### python/multi_language_project/__init__.py
```python
__version__ = "1.1.0"
```

#### rust/src/lib.rs
```rust
pub const VERSION: &str = "1.1.0";
```

### CHANGELOG.md
```markdown
# Changelog

## [1.1.0] - 2024-01-16

### Added
- User management functionality across all languages (feat(user-service))
- TypeScript: UserService class with CRUD operations
- Python: Pydantic-based user models with async operations
- Rust: UserService with HashMap storage and serialization
- Consistent API design across all language implementations

## [1.0.0] - 2024-01-15

### Added
- Initial multi-language project setup
- TypeScript, Python, and Rust configurations
- Shared changelog and version management
- SmartCommit integration for cross-language versioning
```

## Advanced Features

### Version Check Command
```bash
/smartcommit.version --check
```

**Output:**
```
📋 Multi-Language Version Analysis
├── package.json: 1.1.0 ✅
├── pyproject.toml: 1.1.0 ✅
├── Cargo.toml: 1.1.0 ✅
├── src/version.ts: 1.1.0 ✅
├── python/multi_language_project/__init__.py: 1.1.0 ✅
└── rust/src/lib.rs: 1.1.0 ✅

✅ All version files synchronized successfully
📁 6 files checked, 0 inconsistencies found
```

### Dry Run Mode
```bash
/smartcommit.version --dry-run --minor
```

**Output:**
```
🔍 Dry run: Version bump simulation
📦 Current version: 1.1.0
🚀 Proposed version: 1.2.0 (minor bump)

📝 Files that would be updated:
├── package.json: 1.1.0 → 1.2.0
├── pyproject.toml: 1.1.0 → 1.2.0
├── Cargo.toml: 1.1.0 → 1.2.0
├── src/version.ts: 1.1.0 → 1.2.0
├── python/multi_language_project/__init__.py: 1.1.0 → 1.2.0
└── rust/src/lib.rs: 1.1.0 → 1.2.0

💡 Use --no-dry-run to apply changes
```

### Selective Version Updates
```bash
# Update only specific file types
/smartcommit.version --set=1.2.0 --files="package.json,pyproject.toml"

# Update only custom files
/smartcommit.version --set=1.2.0 --custom-only

# Update configuration files only (not custom files)
/smartcommit.version --set=1.2.0 --config-only
```

## Best Practices for Multi-Language Projects

### 1. Consistent API Design
- Maintain similar method signatures across languages
- Use consistent error handling patterns
- Align data structures and serialization formats

### 2. Version Synchronization
- Use SmartCommit to ensure all configuration files stay in sync
- Include version constants in source code for runtime access
- Validate version consistency before releases

### 3. Shared Changelog
- Maintain a single CHANGELOG.md for the entire project
- Document changes across all languages
- Reference language-specific implementations when relevant

### 4. Commit Message Standards
- Include language scope in commit messages when relevant
- Use consistent terminology across all languages
- Reference cross-language changes in commit descriptions

### 5. Testing Strategy
- Ensure equivalent functionality across all implementations
- Use consistent test data and expected results
- Document any language-specific differences

## Integration with CI/CD

### GitHub Actions Example
```yaml
name: Multi-Language Release
on:
  push:
    tags: ['v*']

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Setup Rust
        uses: actions-rs/toolchain@v1
        with:
          toolchain: stable

      - name: Update versions
        run: |
          VERSION=${GITHUB_REF#refs/tags/v}
          smartcommit.version --set=$VERSION

      - name: Build all languages
        run: |
          npm run build
          python -m build
          cargo build --release

      - name: Update changelog
        run: smartcommit.changelog --release

      - name: Commit version updates
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add -A
          git commit -m "chore: Release $VERSION"
          git push
```

## Key Takeaways

1. **Unified Version Management**: SmartCommit handles version synchronization across multiple configuration formats automatically
2. **Consistent Changelog**: Single changelog captures changes across all language implementations
3. **Custom File Support**: Version constants in source code are kept in sync with configuration files
4. **Cross-Language Analysis**: SmartCommit recognizes patterns across different language implementations
5. **Flexible Configuration**: Easy to add new languages or custom version files to the synchronization process

This example demonstrates SmartCommit's powerful capability to manage complex, multi-language projects with consistent versioning and changelog management across all components.