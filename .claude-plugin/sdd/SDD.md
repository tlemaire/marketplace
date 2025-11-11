# Spec-Driven Development (SDD) Skill

**Description**: **Claude Code exclusive skill** for implementing Spec-Driven Development using GitHub Spec Kit principles. Transform specifications into executable code through a structured workflow optimized for Claude Code.

## 🎯 What is SDD?

**Spec-Driven Development (SDD)** is a software development methodology that emphasizes **specifications first** before implementation. This approach ensures:

✅ **Clear requirements** - Well-defined functional and non-functional requirements
✅ **Reduced ambiguity** - Eliminates confusion through detailed specifications
✅ **Better planning** - Informed technical decisions based on complete requirements
✅ **Quality assurance** - Built-in checklists and validation steps
✅ **Traceability** - Direct link between requirements and implementation

## 🚀 Core Features

- **📋 Specification Creation**: Transform natural language descriptions into structured specifications with user stories and acceptance criteria
- **🏗️ Technical Planning**: Generate detailed implementation plans with architecture decisions and technology choices
- **📝 Task Generation**: Break down complex features into dependency-organized, actionable tasks
- **❓ Clarification**: Identify and resolve specification ambiguities through interactive questioning
- **✅ Quality Control**: Generate comprehensive checklists and consistency analysis
- **📚 Help System**: Access comprehensive command documentation and workflow guidance
- **🔄 Iterative Development**: Support for feature versioning and incremental improvements
- **🌐 Git Integration**: Automatic branch creation and management for feature development

## SDD Workflow

0. **Help**: `/sdd.help` - Get help with any SDD command or workflow
1. **Constitution**: `/sdd.constitution` - Define project principles
2. **Specification**: `/sdd.specify <description>` - Create functional specification
3. **Clarification**: `/sdd.clarify` - Resolve ambiguities (optional)
4. **Planning**: `/sdd.plan <tech-stack>` - Define technical architecture
5. **Tasks**: `/sdd.tasks` - Generate implementation tasks
6. **Checklists**: `/sdd.checklist <type>` - Create quality checklists
7. **Analysis**: `/sdd.analyze` - Analyze consistency (optional)
8. **Implementation**: `/sdd.implement` - Execute tasks

## Available Commands

### `/sdd.constitution <principles>`
Create or update project constitution with guiding principles.

**Example**:
```
/sdd.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements. Prefer native solutions and maintain <50ms response time.
```

### `/sdd.specify <feature_description>`
Transform description into detailed specification with user stories, requirements, and success criteria.

**Example**:
```
/sdd.specify Build a task management app where users can create tasks, assign priorities, set due dates, and mark tasks complete. Tasks should be filterable by priority and due date.
```

### `/sdd.clarify`
Analyze specifications for `[NEEDS CLARIFICATION]` markers and ask interactive questions.

### `/sdd.plan <tech_stack>`
Generate technical implementation plan based on specification and constitution.

**Example**:
```
/sdd.plan Use vanilla JavaScript with Web Components for UI. Store data in IndexedDB. Use Chart.js for statistics visualization. No backend - fully client-side.
```

### `/sdd.tasks`
Generate dependency-organized task list from the plan.

### `/sdd.checklist <type>`
Create quality checklists for different aspects (requirements, UX, performance, accessibility).

**Example**:
```
/sdd.checklist Create checklists for requirements, UX, performance, and accessibility
```

### `/sdd.analyze`
Analyze consistency between specification, plan, and constitutional requirements.

### `/sdd.help`
Display comprehensive help information for all SDD commands and workflow.

**Example**:
```
/sdd.help
```

### `/sdd.implement`
Execute generated tasks in dependency order with prerequisite checklist validation.

## 📁 Generated File Structure

Every SDD feature creates a comprehensive documentation structure:

```
specs/
├── 001-photo-album-manager/
│   ├── spec.md              # 📋 Functional specification with user stories
│   ├── plan.md              # 🏗️ Technical implementation plan
│   ├── tasks.md             # 📝 25 dependency-organized tasks
│   ├── research.md          # 🔬 Technical research and decisions
│   ├── data-model.md        # 🗄️ Database schema and data models
│   ├── quickstart.md        # 🚀 Development setup and quick start guide
│   ├── checklists/          # ✅ Quality assurance checklists
│   │   ├── requirements.md  # Requirements validation checklist
│   │   ├── ux.md           # User experience testing checklist
│   │   ├── performance.md   # Performance benchmarks and testing
│   │   └── accessibility.md # Accessibility compliance checklist
│   └── contracts/           # 📄 API contracts and schemas (if applicable)
│       └── api.json        # OpenAPI specification
├── .specify/
│   └── memory/
│       └── constitution.md   # 📜 Project principles and quality standards
```

### File Purposes

- **`spec.md`** - Contains user stories, functional requirements, acceptance criteria, and success metrics
- **`plan.md`** - Technical architecture, technology stack, data flow, and implementation strategy
- **`tasks.md`** - 25 specific tasks organized by dependencies with estimated effort
- **`research.md`** - Technology evaluation, proof-of-concepts, and architectural decisions
- **`data-model.md`** - Database schemas, data relationships, and validation rules
- **`quickstart.md`** - Environment setup, installation steps, and first-run instructions

## 🎯 SDD Core Principles

### 1. **Specification First**
- Define WHAT and WHY before HOW
- Focus on user value and business requirements
- Include acceptance criteria and success metrics

### 2. **Iterative Development**
- Every change follows the same structured workflow
- Version features numerically (001, 002, 003...)
- Build incrementally with validation at each step

### 3. **Traceability**
- Tasks are directly linked to specification requirements
- Implementation decisions reference research findings
- Quality checklists validate against original specifications

### 4. **Quality by Design**
- Checklists and consistency analysis are built into the workflow
- Non-functional requirements are treated as first-class citizens
- Testing and validation are planned from the beginning

### 5. **Pragmatic Architecture**
- Use frameworks directly without unnecessary abstraction layers
- Choose technology based on requirements, not trends
- Start simple and add complexity only when needed

### 6. **Simplicity Focus**
- Maximum 3 projects for initial implementation to maintain focus
- Prefer working solutions over perfect architectures
- Clear documentation over complex implementations

## Installation and Configuration

1. **Claude Code Exclusive**: This skill is specifically designed for Claude Code
2. **Automatic Availability**: Skill is automatically available when used in Claude Code
3. **Zero Configuration**: Commands automatically create necessary directories and files
4. **Git Integration**: Workflow works with Git (automatic branch creation) or without Git
5. **Claude Code Integration**: Seamless integration with Claude Code's capabilities and context

## Usage Examples

### Complete Workflow
```bash
# 1. Initialization
/sdd.constitution Create principles for code quality and performance

# 2. Specification
/sdd.specify Photo album manager with drag-and-drop organization

# 3. Clarification (if needed)
/sdd.clarify

# 4. Planning
/sdd.plan Use Vite with vanilla JavaScript, IndexedDB for storage

# 5. Task generation
/sdd.tasks

# 6. Quality checklists
/sdd.checklist requirements, UX, performance

# 7. Consistency analysis
/sdd.analyze

# 8. Implementation
/sdd.implement
```

### Modifying Existing Feature
```bash
# Switch to feature branch
git checkout 001-photo-albums

# Update specification
/sdd.specify Add sharing functionality to photo albums

# New plan for modifications
/sdd.plan Add sharing API, implement permission system

# Generate new tasks
/sdd.tasks

# Implement
/sdd.implement
```

## Sync with GitHub Spec Kit

### Check for updates
```bash
./scripts/bash/check-spec-kit-updates.sh
```

### Manual sync
```bash
./scripts/bash/sync-sdd-with-speckit.sh [version]
```

### Supported versions
- Spec Kit v0.0.79+ ✅
- Features: remote branch checking, enhanced releases, local testing

## Claude Code Integration

### Why Claude Code Exclusive?
- **Native Integration**: Built specifically for Claude Code's architecture and capabilities
- **Optimized Workflow**: Leverages Claude Code's unique features like context awareness and tool integration
- **Seamless Experience**: No configuration required - works out of the box with Claude Code
- **Enhanced Features**: Utilizes Claude Code-specific capabilities for better SDD implementation

### Claude Code Features Used
- **Native Slash Commands**: Direct integration with Claude Code's command system
- **Context Management**: Maintains SDD context across conversations
- **Tool Integration**: Uses Claude Code's file operations, bash commands, and analysis tools
- **Project Awareness**: Understands project structure and Git repositories
- **Session Persistence**: Maintains SDD workflow state across sessions

## Maintenance

### Automatic
```bash
# Add to .git/hooks/pre-commit or cron
./scripts/bash/check-spec-kit-updates.sh
```

### Manual
1. Check releases: https://github.com/github/spec-kit/releases
2. Sync with new version
3. Test new commands/features
4. Update documentation

---

**Transform your ideas into structured specifications and executable code with the SDD workflow!**

*Claude Code Exclusive • Kept in sync with GitHub Spec Kit*

**Made with ❤️ for Claude Code users**