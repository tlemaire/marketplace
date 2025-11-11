---
description: Create or update project constitution with guiding principles
shortcut: sdd.constitution
---

# SDD Constitution Command

Create or update project constitution with guiding principles and quality standards.

## What to do:

1. **Parse user input** for principles, guidelines, and quality standards
2. **Check for existing constitution** in common locations:
   - `.specify/memory/constitution.md` (if exists)
   - `CONSTITUTION.md` in project root
   - `docs/constitution.md` (if docs directory exists)
   - Ask user to specify location if multiple found
3. **Create comprehensive constitution** with these sections:
   - **Project Principles** - Core development values
   - **Quality Standards** - Code quality, testing, documentation
   - **Technical Guidelines** - Framework choices, patterns, conventions
   - **Performance Requirements** - Response times, scalability, limits
   - **Security Standards** - Authentication, data protection, validation
   - **User Experience Principles** - Design consistency, accessibility
   - **Development Workflow** - Git process, review requirements
   - **Deployment Guidelines** - Environments, release process

4. **Choose appropriate location** for the constitution:
   - **Preferred**: `.specify/memory/constitution.md` (creates directory if needed)
   - **Alternative**: `CONSTITUTION.md` in project root
   - **Fallback**: Ask user for preferred location
5. **Write constitution.md** with formatted markdown sections
6. **Reference existing standards** if user mentions specific frameworks or methodologies

## Output Format:
```markdown
# Project Constitution

## Core Principles
[User-provided principles]

## Quality Standards
- Code quality requirements
- Testing standards
- Documentation expectations

## Technical Guidelines
- Framework preferences
- Architecture patterns
- Coding conventions

## Performance Requirements
- Response time targets
- Scalability considerations
- Resource limits

## Security Standards
- Authentication requirements
- Data protection guidelines
- Input validation standards

## User Experience
- Design consistency rules
- Accessibility requirements
- Usability principles

## Development Workflow
- Git branching strategy
- Code review requirements
- Testing procedures

## Deployment Guidelines
- Environment configurations
- Release processes
- Monitoring requirements
```

7. **Confirm successful creation** and show next steps in SDD workflow

Focus on creating actionable, specific guidelines that can be referenced throughout development.