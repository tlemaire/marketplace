# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **SDD (Spec-Driven Development) skill** - a Claude Code exclusive skill that implements the Spec-Driven Development methodology using GitHub Spec Kit principles. The skill transforms ideas into structured specifications and executable code through a workflow optimized for Claude Code.

## Key Commands

### Development & Testing
```bash
# Install dependencies and setup
npm install

# Run tests
npm test

# Install/uninstall the skill globally
npm run install
npm run uninstall

# Check for Spec Kit updates
npm run update
# or
./scripts/bash/check-spec-kit-updates.sh
```

### SDD Workflow Commands
These are the core SDD slash commands used within Claude Code:
- `/sdd.help` - Display comprehensive help and workflow guidance
- `/sdd.constitution <principles>` - Define project principles and quality standards
- `/sdd.specify <feature_description>` - Create structured specification from natural language
- `/sdd.clarify` - Resolve specification ambiguities interactively
- `/sdd.plan <tech_stack>` - Generate technical implementation plan
- `/sdd.tasks` - Create dependency-organized task list
- `/sdd.checklist <type>` - Generate quality checklists (requirements, UX, performance, accessibility)
- `/sdd.analyze` - Analyze consistency between spec, plan, and constitution
- `/sdd.implement` - Execute implementation tasks in dependency order

### Utility Scripts
```bash
# Create new feature specification
./scripts/bash/create-new-feature.sh "<feature description>"

# Setup implementation plan for current feature
./scripts/bash/setup-plan.sh

# Generate tasks from plan
./scripts/bash/generate-tasks.sh

# Sync with latest Spec Kit version
./scripts/bash/sync-sdd-with-speckit.sh [version]
```

## Architecture

### Core Components

1. **Skill Definition** (`SDD.md`): Main skill documentation and command reference
2. **Package Configuration** (`package.json`): Claude Code skill metadata and npm scripts
3. **Bash Scripts** (`scripts/bash/`): Automation utilities for SDD workflow
4. **Specification Templates**: Generated templates for specs, plans, and tasks
5. **Feature Management** (`specs/`): Organized feature specifications and implementation plans

### Generated Structure

When SDD commands are used, they generate a structured hierarchy:

```
specs/
├── XXX-feature-name/
│   ├── spec.md              # Functional specification with user stories
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
├── .specify/
│   └── memory/
│       └── constitution.md   # Project principles and quality standards
```

### SDD Workflow Principles

1. **Specification First**: Define WHAT and WHY before HOW
2. **Iterative Development**: Every change follows the same structured workflow
3. **Traceability**: Tasks are linked to specifications and requirements
4. **Quality by Design**: Checklists and consistency analysis are integrated
5. **Anti-Abstraction**: Use frameworks directly without unnecessary layers
6. **Simplicity Focus**: Start simple, add complexity only when needed

## Integration Points

### Claude Code Integration
- **Native Slash Commands**: Direct integration with Claude Code's command system
- **Context Management**: Maintains SDD workflow state across conversations
- **File Operations**: Uses Claude Code's advanced file handling capabilities
- **Git Integration**: Automatic branch creation and management when Git repository is detected

### GitHub Spec Kit Sync
The skill stays synchronized with GitHub Spec Kit:
- Supports Spec Kit v0.0.79+
- Automatic update checking available
- Manual sync with specific versions supported
- Remote branch checking and enhanced releases

## Development Guidelines

### When Modifying the Skill
1. Test SDD commands end-to-end after changes
2. Verify compatibility with latest Claude Code version
3. Ensure bash scripts work across different shells (bash, zsh)
4. Update documentation for any new commands or workflows

### When Adding Features
- Follow the existing slash command pattern (`/sdd.<command>`)
- Update both `SDD.md` and `README.md` documentation
- Add corresponding bash scripts if automation is needed
- Test with various feature descriptions and tech stacks

### Quality Assurance
- Run `npm test` before committing changes
- Test SDD workflow with sample specifications
- Verify generated templates are valid and complete
- Check Git integration works correctly

## Environment Variables

Optional environment variables for customization:
- `SPECIFY_FEATURE`: Current feature branch name (auto-set by scripts)
- `SDD_SKILL_HOME`: Custom installation directory (defaults to ~/.claude/skills/sdd)
- `SDD_GLOBAL_ENABLED`: Enable global skill availability (true/false)

## File Dependencies

The skill depends on these external tools:
- Git (for branch management and version control)
- Node.js 14+ (for npm scripts and installation)
- Claude Code 2.0.37+ (for slash commands and integration)
- GitHub Spec Kit (for specification framework synchronization)