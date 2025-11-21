# 🚀 Marketplace

Claude Code plugins, tools, and projects by Thierry Lemaire - enhancing your development workflow with powerful AI integrations and automation.

## ✨ Available Plugins & Projects

### 🧠 SDD - Spec-Driven Development + TDD

Transform ideas into structured specifications and executable code through systematic **Spec-Driven Development + Test-Driven Development** workflow.

**🔥 Key Features:**
- 13 workflow commands (9 core + 4 🆕 TDD commands)
- Complete TDD integration with test-first development
- GitHub Spec Kit compliance with 100% workflow alignment
- Enhanced memory architecture (Project → Feature → Quality → Testing)
- Automatic quality assurance checklists with comprehensive testing validation
- Progressive learning path with 5 complexity levels (beginner to enterprise)
- Red-Green-Refactor workflow with coverage monitoring and quality gates

**🆕 TDD Commands:**
- `/sdd.tdd.specify` - Create test specifications from requirements
- `/sdd.tdd.design` - Design test architecture and strategy
- `/sdd.tdd.implement` - Execute TDD implementation workflow
- `/sdd.tdd.coverage` - Analyze test coverage and generate reports

**⚡ Enhanced Quick Start (with TDD)**:
```bash
claude plugin marketplace add https://github.com/tlemaire/marketplace
claude plugin install sdd@marketplace

# Complete SDD + TDD workflow
/sdd.constitution "Secure, fast, scalable, well-tested"
/sdd.specify "Create user authentication system"
/sdd.tdd.specify "unit,integration,e2e,security"      # 🆕 Test specifications
/sdd.plan "React, TypeScript, Node.js, PostgreSQL"
/sdd.tdd.design "jest,playwright" pyramid            # 🆕 Test architecture
/sdd.tasks
/sdd.tdd.implement all user-authentication           # 🆕 Test-first implementation
/sdd.tdd.coverage --format html --threshold 85       # 🆕 Coverage monitoring
/sdd.validate
```

**📚 Documentation**:
- See [sdd/README.md](sdd/README.md) for complete SDD + TDD details and workflow examples
- View [sdd/specs/001-sdd-plugin/compliance.md](sdd/specs/001-sdd-plugin/compliance.md) for comprehensive GitHub Spec Kit compliance analysis (100% ✅)
- Explore [sdd/samples/](sdd/samples/) directory for **TDD-enhanced** example projects by complexity level
- Check [sdd/templates/testing-checklist.md](sdd/templates/testing-checklist.md) for comprehensive testing quality gates

### 🤖 SmartCommit

**Claude-Native intelligent git workflow automation** - analyze changes, generate commits, manage changelogs, and create releases.

**🔥 Key Features:**
- **Claude-Native Architecture**: Direct Claude execution with no Python complexity
- **Intelligent Analysis**: Smart git state detection and change categorization
- **Automatic Commit Generation**: Conventional commit messages based on file types
- **Changelog Management**: Automatic CHANGELOG.md updates with proper entries
- **Release Automation**: Semantic versioning and git tag creation
- **Zero Configuration**: Works out of the box with KISS principles

**🚀 Modes of Operation:**
- **🔄 Development Mode**: Analyze staged changes → Generate commit → Update changelog → Execute
- **🚀 Release Mode**: Clean tree + [Unreleased] entries → Create version → Generate tag
- **📋 Setup Mode**: No CHANGELOG.md → Initialize project structure

**⚡ Quick Start**:
```bash
claude plugin install smartcommit@marketplace

# Make your changes
git add .

# SmartCommit handles everything intelligently
/smartcommit.commit

# Preview actions safely
/smartcommit.commit --dry-run
```

**📚 Documentation**: See [smartcommit/README.md](smartcommit/README.md) for complete details and usage examples.

### 🌐 Claude Proxy - Multi-Provider AI Integration

Production-ready proxy server enabling Claude Code to work with multiple AI providers including GLM 4.6, vLLM, Ollama, and OpenAI.

**🔥 Key Features:**
- **GLM 4.6 Integration**: Direct Z.AI support with 10% discount subscription
- **Multi-Provider Architecture**: Support for vLLM, Ollama, OpenAI, and GLM providers
- **Anthropic API Compatible**: Drop-in replacement with full Claude Code compatibility
- **Production Ready**: TypeScript, Express.js, performance monitoring, error handling
- **High Performance**: Optimized for 4x H100 GPU setups with streaming support

**⚡ GLM 4.6 Quick Start**:
```bash
# Direct GLM 4.6 integration (recommended)
export ANTHROPIC_AUTH_TOKEN=your_zai_api_key
export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic

# Get GLM 4.6 access: https://z.ai/subscribe?ic=9KB0OPJIMF
# Plans start at $3/month with 10% discount via invite link
```

**⚡ Proxy Server Quick Start**:
```bash
cd claude-proxy
npm install
npm run dev

# Configure Claude Code
export ANTHROPIC_API_URL=http://localhost:3000/v1
export ANTHROPIC_API_KEY=proxy-key
```

**📚 Documentation**: See [claude-proxy/README.md](claude-proxy/README.md) for complete setup instructions and provider configurations.

## 📋 Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed version history and release notes.

## 🚀 Installation

### 🏪 Add Marketplace
```bash
claude plugin marketplace add https://github.com/tlemaire/marketplace
```

### 📦 Install Plugins

#### Install Both Plugins
```bash
claude plugin install sdd@marketplace
claude plugin install smartcommit@marketplace
```

#### List Installed Plugins
```bash
claude plugin marketplace list
```

#### Verify Installation
```bash
/sdd.help           # Show SDD help
/smartcommit.help   # Show SmartCommit help
```

## 🎯 Usage Examples

### Complete SDD + TDD Workflow (NEW)
```bash
# 1. Define project principles (with testing focus)
/sdd.constitution "KISS principles, React, TypeScript, test-first development"

# 2. Create specification
/sdd.specify "Add user authentication system"

# 3. Create test specifications (NEW)
/sdd.tdd.specify "unit,integration,e2e,security"

# 4. Generate technical plan
/sdd.plan "React, TypeScript, Node.js, PostgreSQL"

# 5. Design test architecture (NEW)
/sdd.tdd.design "jest,playwright" pyramid

# 6. Create task list (TDD-enhanced)
/sdd.tasks

# 7. Implement with test-first development (NEW)
/sdd.tdd.implement all user-authentication

# 8. Monitor coverage and quality (NEW)
/sdd.tdd.coverage --format html --threshold 85

# 9. Final validation
/sdd.validate
```

### Basic SDD Workflow
```bash
# 1. Define project principles
/sdd.constitution "KISS principles, React, TypeScript"

# 2. Create specification
/sdd.specify "Add user authentication system"

# 3. Generate technical plan
/sdd.plan "React, TypeScript, Node.js, PostgreSQL"

# 4. Create task list
/sdd.tasks

# 5. Execute implementation
/sdd.implement
```

### Smart Commit Workflow
```bash
# Stage your changes
git add .

# Generate intelligent commit with changelog update
/smartcommit.commit

# Preview without committing
/smartcommit.commit --dry-run
```

## 🏗️ Plugin & Project Structure

```
marketplace/
├── 📋 CHANGELOG.md           # Unified changelog for all plugins
├── 📦 .claude-plugin/        # Marketplace configuration
├── 🧠 sdd/                   # Spec-Driven Development + TDD plugin
│   ├── 📝 commands/          # 13 workflow commands (9 core + 4 TDD)
│   │   ├── core/             # Core SDD workflow commands
│   │   ├── quality/          # Quality assurance commands
│   │   └── tdd/              # 🆕 Test-Driven Development commands
│   ├── 📚 samples/           # 🆕 TDD-enhanced example projects by complexity
│   ├── 📝 templates/         # 🆕 Project templates and checklists
│   └── 📖 README.md          # Complete SDD + TDD documentation
├── 🤖 smartcommit/           # SmartCommit plugin (Claude-Native)
│   ├── 💬 commands/          # Single command with embedded Claude logic
│   ├── 📚 samples/           # Usage examples (simple, multi-language, enterprise)
│   └── 📖 README.md          # SmartCommit documentation
└── 🌐 claude-proxy/          # Multi-Provider AI Integration
    ├── 🔧 src/               # TypeScript source code
    │   ├── providers/        # AI provider adapters (GLM, vLLM, Ollama, OpenAI)
    │   ├── routes/           # API route handlers
    │   ├── types/            # TypeScript definitions
    │   └── utils/            # Utilities and helpers
    ├── 📝 examples/          # Setup scripts and benchmarks
    ├── ⚙️ .env.example       # Environment configuration template
    └── 📖 README.md          # Claude Proxy documentation
```

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. **🍴 Fork** this repository
2. **🔧 Create** your plugin in the marketplace directory
3. **📚 Add** comprehensive documentation and examples
4. **🧪 Test** your plugin thoroughly
5. **📤 Submit** a pull request with detailed description

### Plugin Development Guidelines

- Follow the established plugin structure in existing plugins
- Include comprehensive README.md with usage examples
- Add proper command documentation with YAML frontmatter
- Provide sample projects where applicable
- Follow conventional commit format for your plugin changes

## 📄 License

All plugins in this marketplace are licensed under **MIT License**.

## 🔗 Links

- **📋 Changelog**: [CHANGELOG.md](CHANGELOG.md) - Version history and release notes
- **🧠 SDD + TDD Plugin**: [sdd/README.md](sdd/README.md) - Complete SDD + TDD documentation
- **🧪 TDD Commands**: [sdd/commands/tdd/](sdd/commands/tdd/) - Test-Driven Development command documentation
- **📚 TDD-Enhanced Samples**: [sdd/samples/](sdd/samples/) - Example projects with comprehensive testing
- **🎯 Testing Checklist**: [sdd/templates/testing-checklist.md](sdd/templates/testing-checklist.md) - Comprehensive testing quality gates
- **📊 Spec Kit Compliance**: [sdd/specs/001-sdd-plugin/compliance.md](sdd/specs/001-sdd-plugin/compliance.md) - GitHub Spec Kit compliance analysis (100% ✅)
- **🤖 SmartCommit Plugin**: [smartcommit/README.md](smartcommit/README.md) - Complete SmartCommit documentation
- **🌐 Claude Proxy**: [claude-proxy/README.md](claude-proxy/README.md) - Multi-provider AI integration documentation
- **⭐ GitHub**: [tlemaire/marketplace](https://github.com/tlemaire/marketplace) - Source repository

---

**🚀 Ready to build better software with comprehensive testing? Install the enhanced SDD + TDD plugin and start writing test-first, specification-driven code today!**

---

**🚀 Ready to supercharge your Claude Code workflow? Install these plugins and start building better software, faster!**