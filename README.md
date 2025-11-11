# Thierry Lemaire Marketplace

Personal marketplace for Claude Code plugins and skills by Thierry Lemaire.

## Available Plugins

### SDD - Spec-Driven Development

**Description**: Claude Code exclusive skill for implementing Spec-Driven Development using GitHub Spec Kit principles. Transform ideas into structured specifications and executable code through a structured workflow.

**Installation**:
```bash
# Add this marketplace
claude plugin marketplace add https://github.com/tlemaire/thierry-lemaire-marketplace

# Install SDD plugin
claude plugin install sdd@thierry-lemaire-marketplace
```

**Features**:
- 📋 Specification Creation: Transform natural language into structured specifications
- 🏗️ Technical Planning: Generate detailed implementation plans with environment setup
- 📝 Task Generation: Break down features into 25 dependency-organized tasks
- ❓ Clarification: Resolve specification ambiguities interactively
- ✅ Quality Control: Generate comprehensive checklists and consistency analysis
- 🔄 Git Integration: Automatic branch creation and management
- 🏛️ Constitution Builder: Create project principles with KISS and YAGNI guidelines
- 🔧 Development Automation: Generate .env templates and Makefiles for workflow automation
- 📊 Consistency Analysis: Ensure alignment between specifications and implementation

**Commands**:
- `/sdd.help` - Display comprehensive help and workflow guidance
- `/sdd.constitution` - Define project principles with KISS and YAGNI guidelines
- `/sdd.specify` - Create structured specification from natural language
- `/sdd.clarify` - Resolve specification ambiguities interactively
- `/sdd.plan` - Generate technical implementation plan with environment setup
- `/sdd.tasks` - Create 25 dependency-organized implementation tasks
- `/sdd.checklist` - Generate quality checklists (requirements, UX, performance, accessibility)
- `/sdd.analyze` - Analyze consistency between spec, plan, and constitution
- `/sdd.implement` - Execute implementation tasks in dependency order

## Quick Start

```bash
# Start a new project with SDD
/sdd.constitution "Follow KISS principles, use React, TypeScript, Node.js"
/sdd.specify "Add user authentication with login and registration"
/sdd.plan "React, TypeScript, Node.js, Express, PostgreSQL"
/sdd.tasks
/sdd.implement
```

## What SDD Generates

**Project Structure Created:**
```
specs/
├── 004-user-authentication/
│   ├── spec.md              # Functional specification with user stories
│   ├── plan.md              # Technical implementation plan
│   ├── tasks.md             # 25 dependency-organized tasks
│   ├── research.md          # Technical research and decisions
│   ├── data-model.md        # Database schema and models
│   └── checklists/          # Quality assurance checklists
CONSTITUTION.md              # Project principles and standards
.env.example                # Environment variables template
Makefile                    # Development automation commands
```

## Key Principles

**KISS (Keep It Simple, Stupid):**
- Choose simple over complex solutions
- Use built-in language features before adding libraries
- Write straightforward code that's easy to understand

**YAGNI (You Aren't Gonna Need It):**
- Don't over-engineer solutions
- Don't add complexity for future problems
- Build only what you need right now

## Benefits

- **🎯 Clear Requirements**: Structured specifications eliminate ambiguity
- **⚡ Rapid Development**: Automated task generation and environment setup
- **🔧 Standardized Workflow**: Consistent process across all features
- **📋 Quality Assurance**: Built-in checklists and consistency analysis
- **🔄 Traceability**: Direct links from requirements to implementation
- **🛠️ Developer Friendly**: Makefile and .env templates for immediate productivity

## Usage

After installation, you can use any SDD command by typing `/sdd.<command>` in Claude Code.

## Example Workflow

```bash
# 1. Define project principles
/sdd.constitution "Prioritize simplicity, use React+TypeScript, maintain 90% test coverage"

# 2. Create feature specification
/sdd.specify "Build a task management system with drag-and-drop functionality"

# 3. Plan technical implementation
/sdd.plan "React, TypeScript, Node.js, Express, PostgreSQL, Docker"

# 4. Generate implementation tasks
/sdd.tasks

# 5. Execute implementation
/sdd.implement
```

## License

All plugins in this marketplace are licensed under MIT License.