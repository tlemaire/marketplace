---
description: Generate comprehensive quality checklists for different aspects
shortcut: sdd.checklist
---

# SDD Checklist Command

Generate comprehensive quality checklists for requirements, UX, performance, and accessibility.

## What to do:

1. **Parse checklist type** from user input:
   - `requirements` - Functional requirements validation
   - `ux` - User experience and design consistency
   - `performance` - Performance and scalability testing
   - `accessibility` - Accessibility compliance (a11y)
   - `all` - Generate all checklist types

2. **Find current specification** by looking for:
   - Most recent `specs/XXX-feature-name/spec.md` file
   - Or specification file in current working directory

3. **Create checklist directory**: `specs/XXX-feature-name/checklists/`
4. **Read project constitution** for quality standards:
   - Check `CONSTITUTION.md` in project root
   - Check `docs/constitution.md`

5. **Generate specific checklists** based on type:

### Requirements Checklist (`requirements.md`):
```markdown
# Requirements Validation Checklist

## Functional Requirements
- [ ] All user stories covered
- [ ] Acceptance criteria testable
- [ ] Business rules implemented
- [ ] Edge cases handled
- [ ] Error conditions defined

## Integration Requirements
- [ ] External dependencies verified
- [ ] API contracts established
- [ ] Data migration planned
- [ ] Backward compatibility checked

## Quality Requirements
- [ ] Performance targets defined
- [ ] Security requirements met
- [ ] Compliance standards followed
- [ ] Documentation complete
```

### UX Checklist (`ux.md`):
```markdown
# User Experience Checklist

## Design Consistency
- [ ] Follows design system guidelines
- [ ] Consistent typography and spacing
- [ ] Proper color contrast
- [ ] Responsive design implemented

## Usability
- [ ] Navigation intuitive
- [ ] User flows logical
- [ ] Error messages helpful
- [ ] Loading states appropriate
- [ ] Feedback mechanisms present

## Content & Interaction
- [ ] Content hierarchy clear
- [ ] Call-to-action prominent
- [ ] Form validation helpful
- [ ] Accessibility labels present
```

### Performance Checklist (`performance.md`):
```markdown
# Performance Checklist

## Response Times
- [ ] API responses under 200ms
- [ ] Page loads under 3 seconds
- [ ] Database queries optimized
- [ ] Caching implemented

## Resource Usage
- [ ] Memory usage monitored
- [ ] CPU usage optimized
- [ ] Network requests minimized
- [ ] Bundle size optimized

## Scalability
- [ ] Load testing completed
- [ ] Database scaling planned
- [ ] CDN implemented
- [ ] Monitoring in place
```

### Accessibility Checklist (`accessibility.md`):
```markdown
# Accessibility Checklist (WCAG 2.1)

## Perceivable
- [ ] Alt text for images
- [ ] Text contrast ratio 4.5:1
- [ ] Video captions available
- [ ] Content reflows properly

## Operable
- [ ] Keyboard navigation works
- [ ] Focus indicators visible
- [ ] No keyboard traps
- [ ] Touch targets 44px minimum

## Understandable
- [ ] Page titles descriptive
- [ ] Language identified
- [ ] Instructions clear
- [ ] Error messages helpful

## Robust
- [ ] HTML semantics correct
- [ ] ARIA labels appropriate
- [ ] Screen reader compatible
- [ ] Assistive technology supported
```

## Special Feature: `all` Type
When user requests `/sdd.checklist all`, generate all four checklists and create:
```markdown
# Quality Assurance Summary

## Checklist Overview
- Requirements: [X/10] complete
- UX: [Y/15] complete
- Performance: [Z/12] complete
- Accessibility: [A/16] complete

## Critical Issues
[List any blocking issues]

## Recommendations
[Overall quality recommendations]
```

## Customization:
- **Project Constitution**: Incorporate specific quality standards
- **Feature Type**: Tailor checklists to feature complexity
- **Tech Stack**: Adjust items based on technologies used

## Git Integration:
- Commit all checklist files to feature branch
- Use descriptive commit message for quality gates

## Output:
- Show checklist file locations
- Display completion percentages if applicable
- Recommend next command: `/sdd.analyze` for consistency check

Focus on creating actionable, measurable quality gates that can be validated during development and testing phases.