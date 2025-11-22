# 🚀 Spec-Driven Development (SDD) Plugin

> **Transform ideas into production-ready code through systematic workflow with built-in quality assurance and automatic documentation**

## 🔒 **NEW: Enterprise-Grade Quality Features**

- **✅ Code Validation**: Automatic code quality checks with auto-fix
- **📚 Documentation Sync**: Real-time documentation updates
- **🔗 Git Hooks**: Automated quality enforcement
- **🧪 Shift-Left Testing**: Testing from specification to deployment
- **🌐 MCP Integration**: Offline documentation and browser testing

## 🎯 **New to SDD? Start Here:**

- **[📖 Quick Start Guide](QUICKSTART.md)** - Get started in 5 minutes
- **[🎬 Interactive Start](START.md)** - Choose your project type
- **[📋 Commands Cheat Sheet](COMMANDS.md)** - All commands in one place
- **[🆘 Help Center](HELP.md)** - Everything you need to know

## 📚 **Experienced Users?**

- **[Complete Documentation](README.md#complete-documentation)** - Full details below
- **[Sample Projects](samples/)** - Real examples by complexity
- **[Templates & Patterns](templates/)** - Ready-to-use templates

## Quick Start

### Installation
```bash
# Add SDD marketplace repository
claude plugin marketplace add https://github.com/tlemaire/marketplace

# Install the plugin
claude plugin install sdd@marketplace

# Verify installation
/sdd.help
```

### Your First Project (with Quality Assurance)
```bash
# 1. Setup quality environment (NEW)
/sdd.setup-hooks --hooks pre-commit --validate-level normal

# 2. Set project principles
/sdd.constitution "Simple, no dependencies, fast loading"

# 3. Create specification
/sdd.specify "Create a simple landing page with contact form"

# 4. Create test specifications (Shift-Left Testing)
/sdd.tdd.specify "unit,integration,e2e"

# 5. Design test architecture
/sdd.tdd.design

# 6. Plan implementation
/sdd.plan "HTML5, CSS3, vanilla JavaScript"

# 7. Generate tasks
/sdd.tasks

# 7. Create quality checklists (Enhanced with TDD)
/sdd.checklist "requirements, ux, testing, performance"

# 8. Implement with automatic validation
/sdd.tdd.implement all

# 9. Automatic quality validation happens on each commit:
git add .
git commit -m "feat: implement landing page"
# → Runs code validation, documentation sync, and tests automatically
```

## Quality-First Workflow (NEW)

```bash
# Setup enterprise-grade quality
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict

# Development with continuous validation
/sdd.specify "User authentication system"
/sdd.plan "React, TypeScript, Node.js"
/sdd.implement

# Automatic validation during development:
# ✅ Code quality checks
# ✅ Documentation synchronization
# ✅ Test validation
# ✅ Security scanning
# ✅ Performance validation
```

## SDD-Compliant Structure

This plugin itself follows the SDD methodology it promotes:

```
sdd/
├── README.md                           # 📖 Project overview
├── .specify/                           # 🧠 Enhanced Memory System
│   └── memory/
│       └── constitution.md             # Project principles (authoritative)
├── .cache/                             # 🆕 Library cache system
│   └── libraries/                      # Offline documentation cache
├── commands/                           # ⚡ Command implementations
│   ├── core/                           # Core SDD commands
│   ├── quality/                        # Quality assurance commands
│   │   ├── code-validate.md            # 🆕 Code validation & auto-fix
│   │   ├── docs-sync.md                # 🆕 Documentation synchronization
│   │   └── setup-hooks.md              # 🆕 Git hooks automation
│   ├── tdd/                            # TDD commands
│   │   ├── specify.md                  # Test specification generator
│   │   ├── design.md                   # Test architecture designer
│   │   ├── implement.md                # TDD implementation workflow
│   │   └── coverage.md                 # Coverage analysis and reporting
│   └── mcp/                            # 🆕 MCP integration commands
│       ├── resolve-library.md          # Library resolution
│       ├── get-docs.md                 # Documentation retrieval
│       ├── browser-test.md             # Browser automation
│       ├── ide-diagnostics.md          # IDE diagnostics
│       ├── cache.md                    # Library caching
│       └── help.md                     # MCP help
├── templates/                          # 📝 Project templates
│   └── testing-checklist.md            # 🆕 Testing quality checklist
└── specs/                              # 📋 Complete specifications
    └── 001-sdd-plugin/                 # Plugin specification
        ├── spec.md                     # Functional specification
        ├── plan.md                     # Technical implementation plan
        ├── tasks.md                    # Implementation tasks
        ├── tdd-spec.md                 # 🆕 Test specifications
        ├── tdd-architecture.md         # 🆕 Test architecture design
        ├── research.md                 # Technical research
        ├── data-model.md               # Data structures
        ├── quickstart.md               # Development setup guide
        ├── .env.example                # Environment variables
        ├── Makefile                    # Development automation
        └── checklists/                 # Quality assurance
            ├── requirements.md         # Requirements validation
            ├── ux.md                   # User experience testing
            ├── testing.md              # 🆕 Testing quality gates
            ├── performance.md          # Performance benchmarks
            ├── accessibility.md        # Accessibility compliance
            └── security.md             # Security validation
```

## Available Commands

### Core Commands
```bash
/sdd.constitution "text"     # Set project principles and standards
/sdd.specify "description"    # Create specification from description
/sdd.plan "tech stack"        # Generate technical implementation plan
/sdd.tasks                   # Generate dependency-organized tasks
/sdd.implement               # Execute implementation workflow
```

### Quality Commands
```bash
/sdd.clarify                 # Resolve specification ambiguities
/sdd.checklist "type"        # Generate quality checklists
/sdd.analyze                 # Analyze consistency between artifacts
```

### 🆕 TDD Commands (Shift-Left Testing)
```bash
/sdd.tdd.specify [focus]     # Create test specifications from requirements
/sdd.tdd.design [framework]  # Design test architecture and strategy
/sdd.tdd.implement [phase]   # Execute TDD implementation workflow
/sdd.tdd.coverage [format]   # Analyze test coverage and generate reports
```

### 🔒 Quality Assurance Commands (NEW)
```bash
/sdd.code-validate [scope]   # Comprehensive code validation with auto-fix
/sdd.docs-sync [type]        # Automatic documentation synchronization
/sdd.setup-hooks [hooks]     # Git hooks automation for quality enforcement
```

### 🌐 MCP Integration Commands (NEW)
```bash
/mcp.resolve [library]       # Resolve library names for documentation
/mcp.docs [library-id]       # Fetch up-to-date library documentation
/mcp.browser [action]        # Automated browser testing
/mcp.diags [severity]        # IDE language diagnostics
/mcp.cache [action]          # Library caching for offline access
/mcp.help                    # MCP commands help
```

### Help Command
```bash
/sdd.help                    # Show comprehensive help and guidance
/sdd.help "command name"     # Get help for specific command
```

## Key Benefits

### For Individual Developers
- **Clarity**: Eliminate scope creep and ambiguous requirements
- **🛡️ Reliability**: Test-first development prevents bugs and regressions
- **Speed**: Automated task generation and environment setup
- **✅ Quality**: Built-in code validation with auto-fix capabilities
- **📚 Documentation**: Automatic documentation synchronization
- **Confidence**: Continuous validation through Git hooks
- **🌐 Resources**: Offline documentation access and browser testing
- **Consistency**: Standardized approach across all projects

### For Teams
- **Collaboration**: Shared understanding through clear specifications
- **🧪 Collective Quality**: Comprehensive test suite ensures team-wide code quality
- **🔒 Consistent Standards**: Git hooks enforce quality across all team members
- **📚 Shared Documentation**: Automatic docs sync keeps team knowledge current
- **Traceability**: Track features from idea to implementation with full validation
- **Onboarding**: Easy for new members to understand project structure and standards
- **🤝 Safe Refactoring**: Automated validation enables confident code changes
- **Visibility**: Clear progress tracking with quality metrics and documentation

### For Enterprise
- **Governance**: Consistent methodology across projects with automated enforcement
- **🔒 Risk Mitigation**: Comprehensive validation prevents production issues
- **Quality Assurance**: Built-in code validation, testing, and documentation sync
- **Compliance**: Automated quality gates and audit-ready documentation
- **Scalability**: Methodology scales from simple to enterprise projects
- **📊 Metrics**: Real-time quality scores and comprehensive reporting
- **Efficiency**: Reduced rework through shift-left testing and validation

## Sample Projects

Explore sample projects by complexity:

- **Beginner**: `samples/01-beginner/hello-world/` - Simple landing page with enterprise quality (70% target)
- **Intermediate**: `samples/02-intermediate/portfolio/` - Professional website with advanced MCP integration (80% target)
- **Advanced**: `samples/03-advanced/kanban-board/` - Real-time kanban system with load testing (85% target)
- **Reference**: `samples/04-reference/authentication/` - Enterprise authentication with compliance features (95% target)
- **Complete**: `samples/05-complete-example/` - Full collaborative application with complete MCP suite (95% target)

### 🚀 **Enterprise Quality & MCP Features in Samples**

All sample projects now include **progressive quality automation** and **MCP integration**:

| Sample | Quality Target | MCP Features | Special Features |
|--------|---------------|--------------|----------------|
| **Beginner** | 70% Basic Quality | Auto-docs, Code Validation | Simple quality gates |
| **Intermediate** | 80% Professional Quality | Full MCP Suite, SEO Validation | Professional workflows |
| **Advanced** | 85% Enterprise Quality | Real-time MCP, Load Testing | Socket.IO, 1000+ users |
| **Reference** | 95% Compliance Quality | Advanced MCP, Security | SOC2, GDPR, HIPAA |
| **Complete** | 95% Mission-Critical | Complete MCP Ecosystem | Collaborative real-time |

#### **🔌 Enterprise MCP Integration Examples**
```bash
# Sample MCP workflows from projects
/mcp.resolve "React" && /mcp.cache add "TypeScript"  # Research and cache
/mcp.browser test --real-time --load-users 1000          # Load testing
/mcp.diags --file src/ --fix --security                 # Code quality
```

#### **✅ Quality Automation Examples**
```bash
# Setup enterprise quality gates
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict

# Automatic validation happens on each commit
git add . && git commit -m "feature: implementation"
# → Code validation, documentation sync, security scan, tests
```

## Documentation

### Plugin Specification
- **[Specification](specs/001-sdd-plugin/spec.md)** - Complete functional requirements
- **[Technical Plan](specs/001-sdd-plugin/plan.md)** - Implementation architecture
- **[Implementation Tasks](specs/001-sdd-plugin/tasks.md)** - Development roadmap
- **[Research](specs/001-sdd-plugin/research.md)** - Technical analysis

### User Guides
- **[Quick Start Guide](specs/001-sdd-plugin/quickstart.md)** - Step-by-step tutorial
- **[How To Guide](specs/001-sdd-plugin/how-to.md)** - Usage patterns and best practices
- **[Developer Guide](specs/001-sdd-plugin/claude-developer-guide.md)** - Claude Code integration

### Compliance
- **[Spec Kit Compliance](specs/001-sdd-plugin/compliance.md)** - GitHub Spec Kit alignment
- **[Requirements Validation](specs/001-sdd-plugin/checklists/requirements.md)** - Quality checklists

## Development

### Setup
```bash
make setup                    # Setup development environment
make validate                 # Validate plugin configuration
make test                     # Run plugin tests
```

### Quality Assurance
```bash
make quality-check            # Run all quality checks
make pre-release              # Pre-release validation
make docs                     # Generate documentation
```

## SDD Methodology

### Core Principles

1. **Specification First**: Every project starts with clear requirements
2. **Test-Driven Development**: Write tests before code implementation
3. **Quality Gates**: Built-in validation ensures project success
4. **Continuous Documentation**: Specifications evolve with the project
5. **Team Collaboration**: Shared understanding through structured documents

### 🚀 Enhanced SDD + Quality Workflow

1. **Constitution**: Establish project principles and quality standards
2. **Specification**: Transform ideas into structured requirements
3. **🆕 Test Specification**: Create comprehensive test requirements (Shift-Left)
4. **Planning**: Design technical implementation approach
5. **🆕 Test Architecture**: Design test framework and strategy
6. **Tasks**: Break down into manageable, dependency-organized tasks
7. **🔒 Quality Setup**: Configure Git hooks and validation (NEW)
8. **🆕 TDD Implementation**: Write tests first, then implementation
9. **✅ Continuous Validation**: Automated code validation during development
10. **📚 Documentation Sync**: Real-time documentation updates
11. **🆕 Coverage Analysis**: Monitor and improve test coverage
12. **Checklists**: Create quality assurance frameworks
13. **Implementation**: Execute with continuous validation
14. **Analysis**: Verify consistency and quality across artifacts

### Shift-Left Testing Benefits

- **🛡️ Risk Reduction**: Tests defined BEFORE implementation prevents defects
- **⚡ Early Detection**: Issues found 100x cheaper in specification phase
- **🎯 Higher Quality**: Comprehensive test coverage ensures robust implementations
- **📈 Maintainable Code**: Tests serve as living documentation and enable safe refactoring
- **🔄 Continuous Confidence**: Automated validation at every development step

### 🌐 MCP Integration Benefits

- **📚 Offline Documentation**: Cached library documentation for reliable access
- **🔍 Real-time Research**: Up-to-date API documentation during planning
- **🎭 Browser Testing**: Automated E2E testing across devices
- **💻 IDE Diagnostics**: Code quality feedback integrated in development

### ✅ Quality Assurance Benefits

- **🔒 Automated Enforcement**: Git hooks prevent code quality violations
- **📝 Documentation Sync**: No more outdated documentation
- **🛠️ Auto-Fix**: Common issues resolved automatically
- **📊 Quality Metrics**: Real-time quality scoring and reporting

## Contributing

This plugin follows the SDD methodology it promotes. All contributions should:

1. Follow the SDD-compliant file structure
2. Include comprehensive specifications for new features
3. Pass all quality checklists and validation
4. Maintain consistency with existing methodology

## License

MIT License - see [LICENSE](specs/001-sdd-plugin/license.md) for details.

## Repository

**Source**: https://github.com/tlemaire/marketplace
**Issues**: Report issues via GitHub issues
**Community**: Join the discussion in the repository discussions

---

**Transform your ideas into successful projects with Spec-Driven Development!**

Start with `/sdd.help` to explore all available commands and features.

## 🧪 Complete TDD Workflow Example

Here's a complete example of using SDD with integrated TDD for a user authentication feature:

```bash
# 1. Set project principles
/sdd.constitution "Secure, fast, scalable, well-tested"

# 2. Create specification for authentication system
/sdd.specify "User authentication with email/password, social login, and session management"

# 3. Create comprehensive test specifications
/sdd.tdd.specify "unit,integration,e2e,security"

# 4. Design technical architecture
/sdd.plan "Node.js, Express, JWT, bcrypt, PostgreSQL, React"

# 5. Design test architecture and strategy
/sdd.tdd.design "jest,supertest,playwright" pyramid

# 6. Generate implementation tasks (TDD-enhanced)
/sdd.tasks

# 7. Create testing quality checklist
/sdd.tdd.checklist "unit,integration,security,coverage"

# 8. Implement with TDD methodology
/sdd.tdd.implement unit user-validation
/sdd.tdd.implement unit authentication-service
/sdd.tdd.implement integration api-endpoints
/sdd.tdd.implement e2e login-workflow

# 9. Monitor and improve coverage
/sdd.tdd.coverage --format html --threshold 85

# 10. Validate complete implementation
/sdd.validate
/sdd.analyze
/sdd.checklist "requirements,ux,testing,security,performance"
```

**Result**: A fully tested, production-ready authentication system with:
- ✅ 90%+ test coverage
- ✅ Comprehensive security testing
- ✅ User journey validation
- ✅ Performance benchmarking
- ✅ Complete documentation