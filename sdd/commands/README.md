# SDD Commands Directory

This directory contains the slash command implementations for the Spec-Driven Development plugin, organized according to SDD methodology and best practices.

## Command Organization

### Core Commands (`core/`)
Foundation commands that establish the SDD workflow, ensure compliance, and create project specifications.

- **[validate.md](core/validate.md)** - `/sdd.validate` - Validate and enforce SDD-compliant structure
- **[help.md](core/help.md)** - `/sdd.help` - Comprehensive help and workflow guidance
- **[constitution.md](core/constitution.md)** - `/sdd.constitution` - Define project principles and quality standards
- **[specify.md](core/specify.md)** - `/sdd.specify` - Create structured specifications with complete SDD structure
- **[clarify.md](core/clarify.md)** - `/sdd.clarify` - Resolve specification ambiguities and refine requirements
- **[plan.md](core/plan.md)** - `/sdd.plan` - Generate technical implementation plans
- **[tasks.md](core/tasks.md)** - `/sdd.tasks` - Create dependency-organized task lists
- **[implement.md](core/implement.md)** - `/sdd.implement` - Execute implementation workflow

### Quality Commands (`quality/`)
Quality assurance and analysis commands that ensure project success and consistency.

- **[checklist.md](quality/checklist.md)** - `/sdd.checklist` - Generate quality checklists for validation
- **[analyze.md](quality/analyze.md)** - `/sdd.analyze` - Analyze consistency between artifacts

### 🆕 TDD Commands (`tdd/`)
Test-Driven Development commands that integrate comprehensive testing into the SDD workflow.

- **[specify.md](tdd/specify.md)** - `/sdd.tdd.specify` - Create test specifications from project requirements
- **[design.md](tdd/design.md)** - `/sdd.tdd.design` - Design test architecture and testing strategy
- **[implement.md](tdd/implement.md)** - `/sdd.tdd.implement` - Execute TDD implementation workflow (Red-Green-Refactor)
- **[coverage.md](tdd/coverage.md)** - `/sdd.tdd.coverage` - Analyze test coverage and generate comprehensive reports

## Command Structure

Each command follows the Claude Code plugin format with YAML frontmatter:

```yaml
---
description: Brief description of command purpose
shortcut: sdd.command_name
parameters:
  - name: "parameter_name"
    type: "string"
    required: true
    description: "Parameter description"
examples:
  - usage: "/sdd.command_name example"
    description: "Example usage description"
---
```

## SDD-Compliant Structure

This commands directory is part of the complete SDD-compliant structure:

```
sdd/
├── README.md                           # Project overview
├── .specify/memory/constitution.md     # Project principles
├── specs/                              # Complete specifications
│   ├── 001-sdd-plugin/                 # Plugin specification
│   └── 002-sdd-commands/               # Commands specification
├── templates/                          # Project templates
│   └── testing-checklist.md            # Testing quality checklist
└── commands/                           # Command implementations
    ├── README.md                       # This file
    ├── core/                           # Core workflow commands
    ├── quality/                        # Quality assurance commands
    └── tdd/                            # 🆕 Test-Driven Development commands
```

## Development Workflow

### Creating New Commands

1. **Specification**: Create detailed requirements in `specs/00X-new-feature/`
2. **Implementation**: Create command file in appropriate directory (`core/` or `quality/`)
3. **Testing**: Validate command functionality and integration
4. **Documentation**: Update command documentation and examples

### Command Categories

- **Core Commands**: Essential workflow commands that create and manage project artifacts
- **Quality Commands**: Commands that validate, analyze, and improve project quality

### Integration Guidelines

- Commands must use the shared template system
- Commands should integrate with the SDD memory system
- Commands must follow the established error handling patterns
- Commands should include comprehensive validation and quality checks

## Quality Assurance

All commands must pass the following quality checks:

- **Functional Testing**: Commands work as specified
- **Integration Testing**: Commands work together in workflows
- **Performance Testing**: Commands meet response time requirements
- **Security Testing**: Commands follow security best practices
- **Usability Testing**: Commands provide good user experience

## Documentation

For complete documentation on the SDD commands system:

- **[Commands Specification](../specs/002-sdd-commands/spec.md)** - Detailed functional requirements
- **[Commands Implementation Plan](../specs/002-sdd-commands/plan.md)** - Technical architecture
- **[Commands Tasks](../specs/002-sdd-commands/tasks.md)** - Implementation roadmap
- **[Requirements Validation](../specs/002-sdd-commands/checklists/requirements.md)** - Quality checklists

## Usage Examples

### Complete SDD + TDD Workflow
```bash
# 1. Validate project structure (new projects start here)
/sdd.validate

# 2. Get help and guidance
/sdd.help

# 3. Establish project principles
/sdd.constitution "Simple, fast, reliable, well-tested"

# 4. Create specification (automatically creates SDD structure)
/sdd.specify "Add user authentication system"

# 5. Create test specifications from requirements (NEW)
/sdd.tdd.specify "unit,integration,e2e,security"

# 6. Validate SDD compliance
/sdd.validate

# 7. Resolve ambiguities
/sdd.clarify

# 8. Generate technical plan
/sdd.plan "React, TypeScript, Node.js"

# 9. Design test architecture (NEW)
/sdd.tdd.design "jest,playwright" pyramid

# 10. Create task list (TDD-enhanced)
/sdd.tasks

# 11. Generate quality checklists (Enhanced with testing)
/sdd.checklist "requirements, ux, testing, security"

# 12. Implement with TDD methodology (NEW)
/sdd.tdd.implement all user-authentication

# 13. Monitor coverage and quality (NEW)
/sdd.tdd.coverage --format html --threshold 85

# 14. Analyze consistency
/sdd.analyze

# 15. Final validation before implementation
/sdd.validate
```

### TDD-Focused Workflow
```bash
# Quick TDD setup for existing project
/sdd.tdd.specify "unit,integration"
/sdd.tdd.design
/sdd.tdd.implement all
/sdd.tdd.coverage --watch
```

### Quality Assurance Workflow
```bash
# Validate specification quality
/sdd.checklist "requirements"

# Analyze artifact consistency
/sdd.analyze

# Generate comprehensive quality validation (Enhanced with testing)
/sdd.checklist "requirements, ux, testing, performance, accessibility, security"

# Comprehensive testing quality validation (NEW)
/sdd.tdd.checklist "unit,integration,e2e,coverage,security"
```

This organized structure ensures that the SDD commands themselves follow the same methodology they promote, providing a consistent and scalable foundation for the complete Spec-Driven Development workflow.