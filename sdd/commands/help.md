---
description: Display comprehensive help information for all SDD commands and workflow
shortcut: sdd.help
---

# SDD Help Command

Display comprehensive help information for all SDD commands and workflow guidance.

## What to do:

1. **Show the complete SDD workflow**:
   - Constitution -> Specify -> Clarify -> Plan -> Tasks -> Checklist -> Analyze -> Implement
   - Explain each step's purpose
   - Mention optional steps (clarify, analyze)

2. **List all available commands with brief descriptions**:
   - `/sdd.constitution` - Define project principles
   - `/sdd.specify` - Create functional specification
   - `/sdd.clarify` - Resolve specification ambiguities
   - `/sdd.plan` - Generate technical implementation plan
   - `/sdd.tasks` - Create dependency-organized task list
   - `/sdd.checklist` - Generate quality checklists
   - `/sdd.analyze` - Analyze specification consistency
   - `/sdd.implement` - Execute implementation tasks

3. **Provide usage examples for each command**:
   - Show typical feature descriptions
   - Demonstrate tech stack specifications
   - Include checklist types

4. **Explain the generated file structure**:
   - `specs/XXX-feature-name/` directory
   - `spec.md`, `plan.md`, `tasks.md` files
   - `checklists/` directory with quality gates
   - Project constitution (created by `/sdd.constitution` in various possible locations)

5. **Show integration points with Claude Code**:
   - Git branch management
   - File operations
   - Context management

6. **Include quick start examples**:
   - Simple feature workflow
   - Complex feature with all steps
   - Iterative development approach

Always provide actionable examples and mention that commands can be used in sequence for complete development workflow.