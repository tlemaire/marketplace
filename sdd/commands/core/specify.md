---
description: Create or update the feature specification from a natural language feature description.
handoffs:
  - label: Build Technical Plan
    agent: sdd.plan
    prompt: Create a plan for the spec. I am building with...
  - label: Clarify Spec Requirements
    agent: sdd.clarify
    prompt: Clarify specification requirements
    send: true
shortcut: sdd.specify
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/sdd.specify` in the triggering message **is** the feature description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that feature description, do this:

1. **Generate a concise short name** (2-4 words) for the branch:
   - Analyze the feature description and extract the most meaningful keywords
   - Create a 2-4 word short name that captures the essence of the feature
   - Use action-noun format when possible (e.g., "add-user-auth", "fix-payment-bug")
   - Preserve technical terms and acronyms (OAuth2, API, JWT, etc.)
   - Keep it concise but descriptive enough to understand the feature at a glance
   - Examples:
     - "I want to add user authentication" → "user-auth"
     - "Implement OAuth2 integration for the API" → "oauth2-api-integration"
     - "Create a dashboard for analytics" → "analytics-dashboard"
     - "Fix payment processing timeout bug" → "fix-payment-timeout"

2. **Check for existing branches before creating new one**:

   a. First, fetch all remote branches to ensure we have the latest information:
      ```bash
      git fetch --all --prune
      ```

   b. Find the highest feature number across all sources for the short-name:
      - Remote branches: `git ls-remote --heads origin | grep -E 'refs/heads/[0-9]+-<short-name>$'`
      - Local branches: `git branch | grep -E '^[* ]*[0-9]+-<short-name>$'`
      - Specs directories: Check for directories matching `specs/[0-9]+-<short-name>`

   c. Determine the next available number:
      - Extract all numbers from all three sources
      - Find the highest number N
      - Use N+1 for the new branch number

3. **Ensure SDD-compliant project structure**:
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

7. **Create complete SDD-enhanced feature structure**:
   - Create feature-specific configuration files
   - Initialize feature-specific documentation
   - Set up feature-specific quality checklists
   - Create feature-specific development automation

8. **Load SDD specification template** and create comprehensive specification with these enhanced sections:

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

9. **Include user stories** in format:
   - As a [user type], I want [action] so that [benefit]
   - Each with clear acceptance criteria

10. **Generate technical requirements** based on feature complexity
11. **Create complete SDD-compliant feature structure**:
    - `.env.example` (feature-specific environment variables)
    - `Makefile` (feature-specific development automation)
    - `checklists/` directory with quality validation files:
      - `requirements.md` (requirements validation checklist)
      - `ux.md` (user experience testing checklist)
      - `performance.md` (performance benchmarks)
      - `accessibility.md` (accessibility compliance)
      - `security.md` (security validation)

12. **Create quickstart guide** in same directory: `quickstart.md`
13. **Write specification file**: `specs/XXX-feature-name/spec.md`

## SDD Enhancement: Quality Validation

After writing the initial spec, validate it against SDD quality criteria:

a. **Create Spec Quality Checklist**: Generate a checklist file at `specs/XXX-feature-name/checklists/requirements.md`

b. **Run Validation Check**: Review the spec against each checklist item

c. **Handle Validation Results**:
   - **If all items pass**: Mark checklist complete and proceed to next phase
   - **If items fail**: Update the spec to address each issue and re-run validation

## Git Integration:
- If in Git repository: `git checkout -b XXX-feature-name`
- Commit specification with meaningful message

## Validation:
- Ensure all requirements are testable
- Check for completeness against user description
- Verify alignment with project constitution

## Output:
- Show created file paths
- Display next command in workflow: `/sdd.plan <tech-stack>`
- Mention option to clarify with `/sdd.clarify` if needed

## General Guidelines

Focus on **WHAT** users need and **WHY**.
Avoid HOW to implement (no tech stack, APIs, code structure).
Written for business stakeholders, not developers.

### Success Criteria Guidelines

Success criteria must be:
1. **Measurable**: Include specific metrics (time, percentage, count, rate)
2. **Technology-agnostic**: No mention of frameworks, languages, databases, or tools
3. **User-focused**: Describe outcomes from user/business perspective, not system internals
4. **Verifiable**: Can be tested/validated without knowing implementation details

## SDD Benefits Over Standard Spec Kit

- **Enhanced Memory Management**: Distributed memory with multiple access points
- **Automated Quality Gates**: Comprehensive checklists beyond basic validation
- **Advanced Task Generation**: 25 dependency-organized tasks with automation
- **Consistency Analysis Engine**: Automated validation across artifacts
- **Professional Documentation**: Enterprise-grade formatting and structure
- **TDD Integration**: Built-in test-driven development workflows
- **MCP Integration**: Model Context Protocol for enhanced AI capabilities

This enhanced SDD version maintains 100% compatibility with GitHub Spec Kit methodology while providing enterprise-grade improvements.