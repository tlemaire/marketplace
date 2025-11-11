---
description: Transform description into detailed functional specification with user stories and requirements
shortcut: sdd.specify
---

# SDD Specify Command

Transform feature description into detailed functional specification with user stories, requirements, and acceptance criteria.

## What to do:

1. **Parse feature description** from user input
2. **Generate feature identifier** (XXX-name format based on sequence)
3. **Create feature directory**: `specs/XXX-feature-name/`
4. **Initialize Git branch**: Create feature branch if in Git repository

5. **Read project constitution** if available:
   - Check `.specify/memory/constitution.md`
   - Check `CONSTITUTION.md` in project root
   - Check `docs/constitution.md`
6. **Create comprehensive specification** with these sections:

   ```markdown
   # Feature Specification: [Feature Name]

   ## Overview
   [Brief description of the feature]

   ## User Stories
   [3-5 detailed user stories with acceptance criteria]

   ## Functional Requirements
   [Detailed functional specifications]

   ## Non-Functional Requirements
   [Performance, security, usability requirements]

   ## Acceptance Criteria
   [Specific, measurable criteria for completion]

   ## Edge Cases and Constraints
   [Limitations, error conditions, special cases]

   ## Dependencies
   [External systems, internal dependencies]

   ## Success Metrics
   [How to measure feature success]
   ```

7. **Include user stories** in format:
   - As a [user type], I want [action] so that [benefit]
   - Each with clear acceptance criteria

8. **Generate technical requirements** based on feature complexity
9. **Create quickstart guide** in same directory: `quickstart.md`
10. **Write specification file**: `specs/XXX-feature-name/spec.md`

## Git Integration:
- If in Git repository: `git checkout -b feature/XXX-feature-name`
- Commit specification with meaningful message

## Validation:
- Ensure all requirements are testable
- Check for completeness against user description
- Verify alignment with project constitution

## Output:
- Show created file paths
- Display next command in workflow: `/sdd.plan <tech-stack>`
- Mention option to clarify with `/sdd.clarify` if needed

Focus on creating clear, actionable specifications that can drive technical planning and implementation.