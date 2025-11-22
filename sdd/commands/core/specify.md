---
description: Transform description into detailed functional specification with user stories and requirements
shortcut: sdd.specify
---

# SDD Specify Command

Transform feature description into detailed functional specification with user stories, requirements, and acceptance criteria.

## What to do:

1. **Parse feature description** from user input
2. **Extract technology mentions** from feature description for potential caching
3. **Generate feature identifier** (XXX-name format based on sequence)
4. **Ensure SDD-compliant project structure**:
   - Verify `.specify/memory/` directory exists
   - Verify `specs/` directory structure exists
   - Create missing directories if needed
   - Validate project is SDD-compliant

4. **Create feature directory**: `specs/XXX-feature-name/`
5. **Initialize Git branch**: Create feature branch if in Git repository

6. **Read project constitution** from SDD-enhanced memory:
   - **Primary**: `.specify/memory/constitution.md`
   - **Fallback**: `CONSTITUTION.md` in project root
   - **Legacy**: `docs/constitution.md` if available

7. **Create complete SDD-compliant feature structure**:
   - Create feature-specific configuration files
   - Initialize feature-specific documentation
   - Set up feature-specific quality checklists
   - Create feature-specific development automation

8. **Create comprehensive specification** with these sections:

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
9. **Create complete SDD-compliant feature structure**:
    - `.env.example` (feature-specific environment variables)
    - `Makefile` (feature-specific development automation)
    - `checklists/` directory with quality validation files:
      - `requirements.md` (requirements validation checklist)
      - `ux.md` (user experience testing checklist)
      - `performance.md` (performance benchmarks)
      - `accessibility.md` (accessibility compliance)
      - `security.md` (security validation)

10. **Create quickstart guide** in same directory: `quickstart.md`
11. **Write specification file**: `specs/XXX-feature-name/spec.md`

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