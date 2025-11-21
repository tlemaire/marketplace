# 🚀 Spec-Driven Development (SDD) Plugin

> **Transform ideas into production-ready code through systematic workflow**

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

### Your First Project (with TDD)
```bash
# 1. Set project principles
/sdd.constitution "Simple, no dependencies, fast loading"

# 2. Create specification
/sdd.specify "Create a simple landing page with contact form"

# 3. Create test specifications (NEW - TDD Integration)
/sdd.tdd.specify "unit,integration,e2e"

# 4. Design test architecture (NEW - TDD Integration)
/sdd.tdd.design

# 5. Plan implementation
/sdd.plan "HTML5, CSS3, vanilla JavaScript"

# 6. Generate tasks
/sdd.tasks

# 7. Create quality checklists (Enhanced with TDD)
/sdd.checklist "requirements, ux, testing, performance"

# 8. Implement with TDD (NEW - Test-First Development)
/sdd.tdd.implement all
```

## SDD-Compliant Structure

This plugin itself follows the SDD methodology it promotes - "eating our own dog food":

```
sdd/
├── README.md                           # 📖 Project overview
├── .specify/                           # 🧠 Enhanced Memory System
│   └── memory/
│       └── constitution.md             # Project principles (authoritative)
├── commands/                           # ⚡ Command implementations
│   ├── core/                           # Core SDD commands
│   ├── quality/                        # Quality assurance commands
│   └── tdd/                            # 🆕 TDD commands (NEW)
│       ├── specify.md                  # Test specification generator
│       ├── design.md                   # Test architecture designer
│       ├── implement.md                # TDD implementation workflow
│       └── coverage.md                 # Coverage analysis and reporting
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

### 🆕 TDD Commands (NEW)
```bash
/sdd.tdd.specify [focus]     # Create test specifications from requirements
/sdd.tdd.design [framework]  # Design test architecture and strategy
/sdd.tdd.implement [phase]   # Execute TDD implementation workflow
/sdd.tdd.coverage [format]   # Analyze test coverage and generate reports
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
- **Quality**: Built-in quality gates and comprehensive testing
- **Confidence**: Automated tests provide continuous validation
- **Consistency**: Standardized approach across all projects

### For Teams
- **Collaboration**: Shared understanding through clear specifications
- **🧪 Collective Quality**: Comprehensive test suite ensures team-wide code quality
- **Traceability**: Track features from idea to implementation (with test coverage)
- **Onboarding**: Easy for new members to understand project structure and tests
- **🤝 Safe Refactoring**: Tests enable confident code changes by multiple developers
- **Visibility**: Clear progress tracking and documentation with test metrics

### For Enterprise
- **Governance**: Consistent methodology across projects
- **🔒 Risk Mitigation**: Comprehensive testing prevents production issues
- **Quality Assurance**: Built-in checklists and validation with test coverage
- **Scalability**: Methodology scales from simple to complex projects
- **📊 Compliance**: Automated testing and coverage reports for audit requirements
- **Efficiency**: Reduced rework and miscommunication through test-driven development

## Sample Projects

Explore sample projects by complexity:

- **Beginner**: `samples/01-beginner/hello-world/` - Simple landing page (1 hour)
- **Intermediate**: `samples/02-intermediate/portfolio/` - Professional website (2-4 weeks)
- **Advanced**: `samples/03-advanced/kanban/` - Collaborative system (6-8 weeks)
- **Complete**: `samples/05-complete-example/` - Full application with all features (6-8 weeks)

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

### Enhanced SDD + TDD Workflow

1. **Constitution**: Establish project principles and quality standards
2. **Specification**: Transform ideas into structured requirements
3. **🆕 Test Specification**: Create comprehensive test requirements from specifications
4. **Planning**: Design technical implementation approach
5. **🆕 Test Architecture**: Design test framework and strategy
6. **Tasks**: Break down into manageable, dependency-organized tasks
7. **🆕 TDD Implementation**: Write tests first, then implementation (Red-Green-Refactor)
8. **🆕 Coverage Analysis**: Monitor and improve test coverage
9. **Checklists**: Create quality assurance frameworks (Enhanced with testing)
10. **Implementation**: Execute with clear guidance and validation
11. **Analysis**: Verify consistency and quality across artifacts

### TDD Integration Benefits

- **🛡️ Risk Reduction**: Tests prevent implementation defects and requirements drift
- **⚡ Faster Development**: Catch issues early with rapid test feedback
- **🎯 Higher Quality**: Comprehensive test coverage ensures robust implementations
- **📈 Maintainable Code**: Tests serve as living documentation and enable safe refactoring
- **🔄 Continuous Confidence**: Automated tests validate system behavior continuously

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