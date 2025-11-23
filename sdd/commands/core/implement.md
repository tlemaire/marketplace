---
description: Execute all tasks to build the feature according to the plan
shortcut: sdd.implement
---

# SDD Implement Command

Execute implementation tasks in dependency order based on current specification, plan, and task list.

## What to do:

1. **Find current files** by looking for:
   - `specs/XXX-feature-name/spec.md` (specification)
   - `specs/XXX-feature-name/plan.md` (technical plan)
   - `specs/XXX-feature-name/tasks.md` (task list)
   - Any analysis reports for readiness confirmation

2. **Validate implementation readiness**:
   - Check if specification is complete
   - Verify technical plan exists
   - Confirm task list is generated
   - Review any analysis reports for blocking issues

3. **Check for prerequisite analysis**:
   - If no analysis found, recommend `/sdd.analyze` first
   - If critical issues exist, recommend fixing before implementation

4. **Setup validation environment**:
   - Check if code validation hooks are installed: `/sdd.setup-hooks --status`
   - If not installed, recommend: `/sdd.setup-hooks --hooks pre-commit --docs-update`
   - Verify validation configuration exists

5. **Initialize implementation workflow**:
   ```markdown
   # Implementation Initialization

   ## Feature: [Feature Name]
   ## Total Tasks: 25
   ## Estimated Duration: [Time estimate]

   ## Starting Implementation
   Ready to begin task execution in dependency order.
   ```

5. **Begin with Task 1** and proceed through each task:

   For each task:
   ```markdown
   ## Task X: [Task Title]

   **Dependencies**: Completed
   **Files**: [List of files to create/modify]
   **Focus**: [What to implement]

   ### Implementation
   [Create/modify code files according to task requirements]

   ### Verification
   - [ ] Acceptance criteria met
   - [ ] Tests written and passing
   - [ ] Code follows project standards
   - [ ] Git commit with descriptive message

   ### Ready for Task X+1?
   [Confirm before proceeding to next task]
   ```

6. **Implementation process for each task**:
   - **Read task requirements** from tasks.md
   - **Identify files** to create or modify
   - **Write code** following technical plan
   - **Create tests** as specified in task
   - **Verify functionality** against acceptance criteria
   - **Commit changes** with meaningful message
   - **Update task status** in tracking

7. **Error handling and recovery**:
   ```markdown
   ## Implementation Issues

   ### Blocker Found
   **Issue**: [Description of problem]
   **Impact**: [How it affects implementation]
   **Options**:
   - [ ] Modify current task approach
   - [ ] Update technical plan
   - [ ] Revise specification
   - [ ] Skip and return later
   ```

8. **Progress tracking**:
   ```markdown
   # Implementation Progress

   ## Completed Tasks (X/25)
   - [x] Task 1: [Title]
   - [x] Task 2: [Title]
   ...

   ## Current Task
   - [ ] Task X: [Title] (In Progress)

   ## Remaining Tasks (25-X)
   - [ ] Task X+1: [Title]
   ...

   ## Progress: X% Complete
   ```

9. **Implementation phases** as defined in tasks.md:
   - **Phase 1**: Foundation (Tasks 1-5)
   - **Phase 2**: Core Functionality (Tasks 6-12)
   - **Phase 3**: User Interface (Tasks 13-18)
   - **Phase 4**: Integration (Tasks 19-22)
   - **Phase 5**: Polish (Tasks 23-25)

10. **Phase completion validation**:
    ```markdown
    ## Phase X Complete

    ### Validation Results
    - [ ] All phase tasks completed
    - [ ] Integration tests passing
    - [ ] Code review completed
    - [ ] Documentation updated

    ### Phase Summary
    **Files Created**: [Number and list]
    **Tests Added**: [Number and coverage]
    **Commits**: [Number and summary]
    ```

## Implementation Guidelines:

### Code Quality:
- Follow project constitution standards
- Write clean, readable code
- Include appropriate comments
- Implement error handling

### Testing Requirements:
- Unit tests for all new functions
- Integration tests for components
- E2E tests for user flows
- Performance tests for critical paths

### Git Workflow:
- Feature-based branching
- Descriptive commit messages
- Regular progress commits
- Pull request for each phase

### Documentation:
- Update README files
- Document new APIs
- Add code comments
- Update deployment guides

### Quality Assurance:
- **Code validation**: Run `/sdd.code-validate --scope staged --fix --update-docs` after each task
- **Documentation sync**: Run `/sdd.docs-sync --auto` for API changes
- **Automated hooks**: Pre-commit hooks will validate automatically
- **Test validation**: Ensure all tests pass before proceeding

## Interactive Mode:
- **Task confirmation**: Ask before starting each task
- **Issue resolution**: Interactive problem-solving
- **Progress validation**: Confirm completion before proceeding
- **Pause/resume**: Allow stopping and continuing later

## Batch Mode:
- **Continuous implementation**: Execute all tasks without interruption
- **Error logging**: Document issues for later review
- **Automated commits**: Commit after each task completion

## Output:
- Show current task and progress
- Display files being created/modified
- Report test results and validation
- Update task completion status
- Provide next task preview

## Completion:
When all 25 tasks are complete:
```markdown
# Implementation Complete!

## Summary
- **Tasks Completed**: 25/25
- **Files Created**: [Total number]
- **Test Coverage**: [Percentage]
- **Implementation Time**: [Duration]

## Final Validation
Running comprehensive validation before deployment completion...

1. **Code Quality Validation**:
   ```bash
   /sdd.code-validate --scope all --strict
   ```

2. **Documentation Synchronization**:
   ```bash
   /sdd.docs-sync --all --auto
   ```

3. **SDD Compliance Check**:
   ```bash
   /sdd.validate --report
   ```

## Quality Gates Passed
- [ ] All requirements implemented
- [ ] Tests passing (≥80% coverage)
- [ ] Code quality validation passed
- [ ] Documentation synchronized
- [ ] SDD compliance confirmed
- [ ] Security validation passed

## Deployment Ready
The feature is complete and ready for deployment to staging/production.

### Next Steps:
1. **Commit final changes**: `git add . && git commit -m "feat: complete [feature name] implementation"`
2. **Create pull request**: For team review and deployment approval
3. **Deploy to staging**: For final integration testing
4. **Production deployment**: After staging validation
```

Focus on systematic, quality-focused implementation that maintains traceability from requirements through code while ensuring all quality gates are passed.