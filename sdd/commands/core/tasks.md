---
description: Generate actionable task lists for implementation
handoffs:
  - label: Execute Implementation
    agent: sdd.implement
    prompt: Execute all tasks to build the feature according to the plan
  - label: Quality Checklist
    agent: sdd.checklist
    prompt: Generate custom quality checklists for the implementation
    send: true
shortcut: sdd.tasks
---

# SDD Tasks Command

Create dependency-organized task list for implementation based on current specification and plan.

## What to do:

1. **Find current files** by looking for:
   - `specs/XXX-feature-name/spec.md` (specification)
   - `specs/XXX-feature-name/plan.md` (technical plan)
   - `specs/XXX-feature-name/data-model.md` (data model if exists)

2. **Analyze requirements and technical decisions** to identify implementation tasks

3. **Generate 25 dependency-organized tasks** covering:
   - Setup and infrastructure (2-3 tasks)
   - Data layer implementation (3-4 tasks)
   - Backend/API implementation (5-6 tasks)
   - Frontend implementation (5-6 tasks)
   - Integration and testing (3-4 tasks)
   - Documentation and deployment (2-3 tasks)

4. **Organize tasks by dependency order**:
   ```markdown
   # Implementation Tasks

   ## Phase 1: Foundation (Tasks 1-5)
   [Setup, database, core infrastructure]

   ## Phase 2: Core Functionality (Tasks 6-12)
   [Backend services, API endpoints]

   ## Phase 3: User Interface (Tasks 13-18)
   [Frontend components, user interactions]

   ## Phase 4: Integration (Tasks 19-22)
   [End-to-end functionality, testing]

   ## Phase 5: Polish (Tasks 23-25)
   [Documentation, deployment, optimization]
   ```

5. **Format each task** with:
   ```markdown
   ### Task X: [Task Title]
   **Dependencies**: [Previous task numbers]
   **Estimated Time**: [Time estimate]
   **Description**: [What needs to be done]
   **Acceptance Criteria**: [How to know it's complete]
   **Files to Create/Modify**: [Specific files]
   **Testing Requirements**: [What tests to write]
   ```

6. **Ensure comprehensive coverage**:
   - Database setup and migrations
   - Backend models and services
   - API endpoints and validation
   - Frontend components and pages
   - State management
   - Error handling
   - Authentication/authorization
   - Integration testing
   - Performance optimization
   - Documentation updates

7. **Create task tracking structure**:
   ```markdown
   ## Task Status Tracking
   - [ ] Task 1: [Title]
   - [ ] Task 2: [Title]
   ...
   - [ ] Task 25: [Title]

   ## Dependencies Graph
   [Simple text representation of task dependencies]
   ```

8. **Write tasks file**: `specs/XXX-feature-name/tasks.md`

## Task Categories:

### Foundation Tasks:
1. Project setup and configuration
2. Database schema creation
3. Development environment setup

### Backend Tasks:
4. Data models implementation
5. Repository/service layer
6. API endpoint development
7. Authentication system
8. Input validation

### Frontend Tasks:
9. Component library setup
10. Core components development
11. State management
12. API integration
13. User interface implementation
14. Error handling implementation

### Integration Tasks:
15. End-to-end testing setup
16. API integration testing
17. User acceptance testing
18. Performance testing

### Polish Tasks:
19. Code review and optimization
20. Documentation completion
21. Deployment configuration
22. Monitoring setup
23. Security audit
24. Accessibility testing
25. Production deployment

## Git Integration:
- Commit tasks file to feature branch
- Create task-specific branches if needed

## Output:
- Show total tasks and phases
- Display next command: `/sdd.implement` or `/sdd.checklist <type>`
- Provide task tracking guidance

Focus on creating actionable, sequential tasks that can be implemented incrementally while maintaining system integrity and testing coverage.