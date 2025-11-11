---
description: Generate detailed technical implementation plan with architecture decisions
shortcut: sdd.plan
---

# SDD Plan Command

Generate detailed technical implementation plan with architecture decisions based on current specification.

## What to do:

1. **Find current specification** by looking for:
   - Most recent `specs/XXX-feature-name/spec.md` file
   - Or specification file in current working directory
   - Or ask user to specify file path if multiple found

2. **Parse tech stack input** from user command:
   - Extract frameworks, languages, databases, tools
   - Identify deployment environment
   - Note any specific libraries or services

3. **Read project constitution** if available:
   - Check `CONSTITUTION.md` in project root
   - Check `docs/constitution.md`
4. **Analyze specification requirements** and map to technical solutions

5. **Generate comprehensive technical plan** with these sections:

   ```markdown
   # Technical Implementation Plan

   ## Architecture Overview
   [High-level system design and component interactions]

   ## Technology Stack
   [Confirmed technologies with versions and rationale]

   ## Data Model
   [Database schema, data structures, relationships]

   ## API Design
   [Endpoints, request/response formats, authentication]

   ## Component Structure
   [Frontend components, backend services, utilities]

   ## Implementation Approach
   [Development methodology, coding standards]

   ## Deployment Strategy
   [Environment setup, CI/CD, infrastructure]

   ## Performance Considerations
   [Optimization strategies, caching, scaling]

   ## Security Implementation
   [Authentication, authorization, data protection]

   ## Testing Strategy
   [Unit tests, integration tests, E2E testing]

   ## Risk Assessment
   [Technical risks and mitigation strategies]
   ```

6. **Create data model documentation**: `data-model.md`
7. **Generate research file**: `research.md` with technical decisions and alternatives
8. **Write main plan file**: `specs/XXX-feature-name/plan.md`

## Data Model Section:
```markdown
# Data Model

## Database Schema
[Table definitions, relationships, indexes]

## Data Structures
[Classes, interfaces, types]

## Data Flow
[How data moves through the system]

## Migration Strategy
[How to handle data changes]
```

## Research Section:
```markdown
# Technical Research

## Technology Choices
[Why specific technologies were selected]

## Alternative Considered
[Options that were evaluated and rejected]

## Proof of Concepts
[Small tests or prototypes if needed]

## External Dependencies
[Third-party services, APIs, libraries]
```

## Git Integration:
- Commit plan and supporting files to feature branch
- Use meaningful commit message describing technical decisions

## Validation:
- Ensure plan addresses all functional requirements
- Verify non-functional requirements are covered
- Check alignment with project constitution
- Validate feasibility within constraints

## Output:
- Show created file paths
- Display next command: `/sdd.tasks`
- Mention option for analysis with `/sdd.analyze`

Focus on creating actionable technical guidance that developers can directly implement while maintaining architectural consistency.