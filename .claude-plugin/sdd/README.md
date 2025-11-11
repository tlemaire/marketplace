# SDD - Spec-Driven Development for Claude Code

**Claude Code Exclusive Skill** • Transform ideas into structured specifications and executable code

## 🎯 What is SDD?

**Spec-Driven Development (SDD)** is a methodology that puts **specifications first** before writing any code. This skill brings SDD to Claude Code, allowing you to:

- ✅ **Create structured specifications** from natural language descriptions
- ✅ **Generate detailed implementation plans** with tech stack choices
- ✅ **Break down projects into manageable tasks** with dependencies
- ✅ **Maintain quality standards** with checklists and validation
- ✅ **Track progress** from idea to working application

## 🚀 Quick Start

### Installation
```bash
# Install the SDD skill
npm install

# Install globally for use anywhere
npm run install
```

### Your First SDD Project
```bash
# 0. Get help anytime
/sdd.help

# 1. Define your project principles
/sdd.constitution Create principles for code quality, testing standards, and user experience

# 2. Specify your feature
/sdd.specify Build a task management app where users can create tasks, assign priorities, set due dates, and mark tasks complete

# 3. Plan your technical approach
/sdd.plan Use vanilla JavaScript with Web Components for UI. Store data in IndexedDB. Use Chart.js for statistics visualization

# 4. Generate implementation tasks
/sdd.tasks

# 5. Execute the implementation
/sdd.implement
```

### Alternative: Script-based Workflow
```bash
# Create new feature specification
./scripts/bash/create-new-feature.sh "Build a photo album manager"

# Setup implementation plan
./scripts/bash/setup-plan.sh

# Generate tasks from plan
./scripts/bash/generate-tasks.sh
```

## 📋 Available Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/sdd.help` | Display help and documentation | `/sdd.help` |
| `/sdd.constitution` | Define project principles | `/sdd.constitution Focus on simplicity, testability, and performance` |
| `/sdd.specify` | Create feature specification | `/sdd.specify Build a photo album manager with drag-and-drop` |
| `/sdd.clarify` | Resolve specification ambiguities | `/sdd.clarify` |
| `/sdd.plan` | Define technical architecture | `/sdd.plan Use React, Node.js, and PostgreSQL` |
| `/sdd.tasks` | Generate implementation tasks | `/sdd.tasks` |
| `/sdd.checklist` | Create quality checklists | `/sdd.checklist requirements, UX, performance` |
| `/sdd.analyze` | Analyze consistency | `/sdd.analyze` |
| `/sdd.implement` | Execute implementation | `/sdd.implement` |

## 🏗️ Generated Structure

```
specs/
├── 003-feature-name/
│   ├── spec.md              # Feature specification with user stories
│   ├── plan.md              # Technical implementation plan
│   ├── tasks.md             # 25 dependency-organized tasks
│   ├── research.md          # Technical research and decisions
│   ├── data-model.md        # Database schema and models
│   ├── quickstart.md        # Development setup guide
│   ├── checklists/          # Quality assurance checklists
│   │   ├── requirements.md
│   │   ├── ux.md
│   │   ├── performance.md
│   │   └── accessibility.md
│   └── contracts/           # API contracts and schemas
│       └── api.json
```

## 💡 Why Claude Code Exclusive?

### 🎯 **Optimized for Claude Code**
- **Native slash commands** work seamlessly with Claude Code's interface
- **Context awareness** maintains SDD workflow across conversations
- **Project understanding** leverages Claude Code's file system awareness
- **Session persistence** keeps your SDD progress intact

### ⚡ **Enhanced Capabilities**
- **Smart file operations** using Claude Code's advanced file handling
- **Git integration** for automatic branch creation and management
- **Template system** with customizable spec and plan templates
- **Quality gates** with automated checklist validation

### 🔧 **Zero Configuration**
- **No setup required** - works immediately in Claude Code
- **Automatic directory creation** for specs and artifacts
- **Built-in version tracking** for features and iterations
- **Seamless workflow** from specification to implementation

## 🎨 Examples

### Web Application
```bash
/sdd.specify Build a real-time collaboration tool with document editing, chat, and video conferencing
/sdd.plan Use WebRTC for video, Socket.io for real-time data, React for UI, Node.js for backend
/sdd.tasks
/sdd.implement
```
**Generated structure:**
- Real-time WebSocket connections for chat
- WebRTC peer-to-peer video conferencing
- Collaborative document editing with operational transforms
- User authentication and session management
- File upload and sharing system

### Mobile App
```bash
/sdd.specify Create a fitness tracking app with workout plans, progress tracking, and social features
/sdd.plan Use React Native, Firebase for backend, HealthKit/Google Fit integration
/sdd.tasks
/sdd.implement
```
**Generated structure:**
- Workout plan library with categorization
- Exercise database with instructions and videos
- Progress tracking with charts and analytics
- Social features for sharing achievements
- Health data integration via native APIs

### API Service
```bash
/sdd.specify Design a RESTful API for user authentication, data storage, and analytics
/sdd.plan Use Python FastAPI, PostgreSQL, Redis for caching, JWT for auth
/sdd.tasks
/sdd.implement
```
**Generated structure:**
- User authentication with JWT tokens
- RESTful API endpoints with OpenAPI documentation
- Database models with migrations
- Redis caching layer for performance
- Analytics dashboard with data visualization

### CLI Tool
```bash
/sdd.specify Create a command-line tool for managing Docker containers and deployments
/sdd.plan Use Python with Click framework, Docker SDK, support for YAML configuration
/sdd.tasks
/sdd.implement
```
**Generated structure:**
- Command-line interface with subcommands
- Docker container management operations
- YAML configuration file parsing
- Logging and error handling
- Auto-completion and help system

## 🔧 Development & Maintenance

### Testing & Quality
```bash
# Run tests to verify skill functionality
npm test

# Check for Spec Kit updates
./scripts/bash/check-spec-kit-updates.sh

# Manual sync with latest version
./scripts/bash/sync-sdd-with-speckit.sh
```

### Installation Options
```bash
# Install dependencies locally
npm install

# Install skill globally for all projects
npm run install

# Uninstall global skill
npm run uninstall

# Development mode (current directory only)
export SDD_SKILL_HOME=$(pwd)
```

### Configuration Files
- **`package.json`** - Skill metadata and npm scripts
- **`CLAUDE.md`** - Development guidelines for Claude Code
- **`SDD.md`** - Complete skill documentation and command reference
- **`.claude/commands/`** - Slash command definitions
- **`templates/`** - Customizable specification templates
- **`scripts/bash/`** - Automation and utility scripts

## 🎯 Best Practices

### 1. **Specification First**
- Always start with `/sdd.specify` before coding
- Focus on WHAT and WHY, not HOW
- Include user stories and acceptance criteria
- Define success metrics and performance targets

### 2. **Iterative Development**
- Use version numbers in feature branches (001, 002, etc.)
- Build incrementally with validation at each step
- Get feedback early and often
- Review and refine specifications after each iteration

### 3. **Quality by Design**
- Always run `/sdd.checklist` before implementation
- Use `/sdd.analyze` to catch inconsistencies
- Test against acceptance criteria
- Conduct code reviews following task completion

### 4. **Technical Excellence**
- Choose appropriate technology stack in `/sdd.plan`
- Consider performance, security, and maintainability
- Document decisions in research files
- Follow coding standards and best practices

## 🚨 Troubleshooting

### Common Issues

**Issue: Commands not recognized**
```bash
# Verify skill installation
ls ~/.claude/skills/sdd/

# Reinstall if needed
npm run uninstall
npm run install
```

**Issue: Specifications feel incomplete**
```bash
# Run clarification process
/sdd.clarify

# Review and enhance spec manually
# Edit specs/XXX-feature-name/spec.md
```

**Issue: Tasks overwhelming**
```bash
# Focus on one task at a time
# Follow dependency order in tasks.md
# Use checkpoints to mark progress
```

**Issue: Git branch conflicts**
```bash
# Sync with main branch
git checkout main
git pull
git checkout 001-feature-name
git rebase main
```

### Getting Help

- **Built-in help**: `/sdd.help` for command reference
- **Documentation**: Check `SDD.md` for detailed guides
- **Examples**: Review generated specs in `specs/` directory
- **Community**: Share issues and solutions with the SDD community

## 📚 Learning Resources

### Documentation
- [Complete SDD Documentation](SDD.md) - Comprehensive guide
- [Command Reference](#available-commands) - All commands with examples
- [Template System](templates/) - Customizable specification formats

### External Resources
- [GitHub Spec Kit](https://github.com/github/spec-kit) - Original specification framework
- [Claude Code Documentation](https://code.claude.com) - Platform features and capabilities
- [Spec-Driven Development Blog](https://github.blog/spec-driven-development) - Best practices and case studies

### Tutorials & Examples
- [Getting Started Guide](docs/getting-started.md) - Step-by-step tutorial
- [Example Projects](examples/) - Real-world SDD implementations
- [Video Walkthroughs](https://youtube.com/claude-code-sdd) - Visual learning resources

## 🛠️ Advanced Features

### **Custom Templates**
Modify templates in `templates/` to customize spec and plan formats for your team.

### **Integration Hooks**
Extend scripts in `scripts/bash/` to add custom validation or automation.

### **Quality Gates**
Configure additional checklists in `.specify/memory/` for team-specific standards.

## 📚 Resources

### Documentation
- [Complete SDD Documentation](SDD.md) - Comprehensive guide and command reference
- [FAQ](FAQ.md) - Frequently asked questions and troubleshooting
- [Contributing Guide](CONTRIBUTING.md) - How to contribute to the project
- [Changelog](CHANGELOG.md) - Version history and release notes
- [Development Guidelines](CLAUDE.md) - Development best practices

### External Resources
- [GitHub Spec Kit](https://github.com/github/spec-kit) - The original specification framework
- [Claude Code Documentation](https://code.claude.com) - Claude Code features and capabilities
- [Spec-Driven Development Blog](https://github.blog/spec-driven-development) - Best practices and case studies

### Community & Support
- [GitHub Issues](https://github.com/your-org/sdd-claude-code-skill/issues) - Bug reports and feature requests
- [GitHub Discussions](https://github.com/your-org/sdd-claude-code-skill/discussions) - Community discussions and Q&A
- [Contributing](CONTRIBUTING.md) - Guidelines for contributing to the project

---

**Transform your development process with SDD for Claude Code!**

*Made with ❤️ exclusively for Claude Code users*