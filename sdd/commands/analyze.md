---
description: Analyze consistency between specification, plan, and constitution
shortcut: sdd.analyze
---

# SDD Analyze Command

Analyze consistency between current specification, technical plan, and project constitution.

## What to do:

1. **Find current files** by looking for:
   - `specs/XXX-feature-name/spec.md` (specification)
   - `specs/XXX-feature-name/plan.md` (technical plan)
   - Project constitution (check `CONSTITUTION.md`, `docs/constitution.md`)
   - Checklists in `specs/XXX-feature-name/checklists/` if available

2. **Perform comprehensive consistency analysis** across these dimensions:

### Specification vs Plan Analysis:
```markdown
## Specification-Plan Alignment

### Coverage Analysis
- [ ] All functional requirements addressed in plan
- [ ] Non-functional requirements covered
- [ ] User stories mapped to technical components
- [ ] Acceptance criteria testable via planned implementation

### Technical Feasibility
- [ ] Technology choices support requirements
- [ ] Architecture handles complexity
- [ ] Performance requirements achievable
- [ ] Security requirements addressed
```

### Constitution Compliance Analysis:
```markdown
## Constitution Compliance

### Quality Standards
- [ ] Code quality guidelines followed
- [ ] Testing standards met
- [ ] Documentation requirements satisfied

### Technical Guidelines
- [ ] Framework choices aligned
- [ ] Architecture patterns consistent
- [ ] Coding conventions followed

### Performance Requirements
- [ ] Response time targets met
- [ ] Scalability considerations addressed
- [ ] Resource constraints respected
```

### Cross-Reference Analysis:
```markdown
## Cross-Reference Validation

### Traceability
- [ ] Requirements → Technical components
- [ ] User stories → Implementation tasks
- [ ] Acceptance criteria → Test cases

### Dependencies
- [ ] External dependencies documented
- [ ] Internal dependencies mapped
- [ ] Risk areas identified

### Gaps and Conflicts
- [ ] Missing implementation details
- [ ] Contradictory requirements
- [ ] Unresolved technical decisions
```

3. **Identify specific issues** with actionable recommendations:
```markdown
## Issues Found

### Critical Issues (Must Fix)
1. **[Issue Description]**
   - **Impact**: Why this matters
   - **Location**: Where to find it
   - **Recommendation**: How to fix it

### Warnings (Should Fix)
1. **[Issue Description]**
   - **Impact**: Potential risks
   - **Recommendation**: Improvement suggestions

### Suggestions (Could Fix)
1. **[Issue Description]**
   - **Impact**: Nice-to-have improvements
   - **Recommendation**: Enhancement ideas
```

4. **Generate consistency score**:
```markdown
## Consistency Score: X/10

### Breakdown:
- Specification Coverage: Y/10
- Technical Feasibility: Z/10
- Constitution Compliance: A/10
- Traceability: B/10

### Overall Assessment:
[Summary of project health and readiness]
```

5. **Create analysis report**: `specs/XXX-feature-name/analysis.md`

## Analysis Categories:

### Functional Consistency:
- Feature completeness
- Requirement traceability
- User story coverage

### Technical Consistency:
- Architecture coherence
- Technology alignment
- Implementation feasibility

### Quality Consistency:
- Standards compliance
- Best practices adherence
- Maintainability considerations

### Process Consistency:
- Workflow alignment
- Documentation completeness
- Testing coverage

## Output Format:
```markdown
# Consistency Analysis Report

## Executive Summary
[Overall project health and key findings]

## Detailed Analysis
[Breakdown by category with specific findings]

## Action Items
[Prioritized list of fixes and improvements]

## Recommendations
[Next steps and quality improvements]

## Ready for Implementation?
[Yes/No with conditions]
```

## Git Integration:
- Commit analysis report to feature branch
- Tag with descriptive message about quality assessment

## Decision Logic:
- **Score 8-10**: Ready for implementation
- **Score 6-7**: Minor fixes needed before implementation
- **Score 4-5**: Significant issues requiring attention
- **Score 0-3**: Major revisions required

## Output:
- Show consistency score and key findings
- List critical issues that must be addressed
- Recommend next command: `/sdd.implement` if ready, or specific fixes if not
- Provide confidence level for successful implementation

Focus on providing actionable insights that improve project quality and implementation success probability.