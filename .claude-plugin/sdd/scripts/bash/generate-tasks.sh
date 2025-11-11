#!/bin/bash
# Spec-Driven Development: Generate Tasks Script
# Usage: ./generate-tasks.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
FEATURE_BRANCH=${SPECIFY_FEATURE:-$(git branch --show-current 2>/dev/null || echo "current")}
SPECS_DIR="specs"
FEATURE_DIR="$SPECS_DIR/$FEATURE_BRANCH"
SPEC_FILE="$FEATURE_DIR/spec.md"
PLAN_FILE="$FEATURE_DIR/plan.md"
TASKS_FILE="$FEATURE_DIR/tasks.md"

# Validation
if [[ ! -f "$SPEC_FILE" ]] || [[ ! -f "$PLAN_FILE" ]]; then
    echo -e "${RED}❌ Required files not found${NC}"
    [[ ! -f "$SPEC_FILE" ]] && echo -e "${YELLOW}   Missing: $SPEC_FILE${NC}"
    [[ ! -f "$PLAN_FILE" ]] && echo -e "${YELLOW}   Missing: $PLAN_FILE${NC}"
    echo -e "${YELLOW}💡 Please run '/sdd.specify' and '/sdd.plan' first${NC}"
    exit 1
fi

# Extract information from spec and plan
FEATURE_TITLE=$(grep "^# Feature Specification:" "$SPEC_FILE" | sed 's/# Feature Specification: //')
TECH_STACK=$(grep "^## Technology Stack" "$PLAN_FILE" -A 10 | grep -v "^##" | grep -v "^$" | head -5)

# Extract user stories from spec
USER_STORIES=$(grep "^### User Story" "$SPEC_FILE" -A 3 | grep -v "^--$")

# Create tasks.md
cat > "$TASKS_FILE" << EOF
# Task Breakdown: $FEATURE_TITLE

**Feature**: $FEATURE_BRANCH
**Generated**: $(date +%Y-%m-%d)
**Total Tasks**: {TOTAL_TASKS}

## Task Status Legend
- [ ] Not Started
- [⚡] In Progress
- [✅] Complete

---

## Phase 1: Project Setup (T001-T004)

### [ ] T001: Initialize Project Structure
**Description**: Create basic project directory structure and configuration files
**Dependencies**: None
**Estimated Time**: 1-2 hours
**Acceptance Criteria**:
- [ ] Project structure follows best practices
- [ ] Configuration files created (package.json, etc.)
- [ ] README.md with project overview

### [ ] T002: Setup Development Environment
**Description**: Configure development tools and dependencies
**Dependencies**: T001
**Estimated Time**: 2-3 hours
**Acceptance Criteria**:
- [ ] All dependencies installed
- [ ] Development server runs locally
- [ ] Linting and formatting configured

### [ ] T003: Version Control Setup
**Description**: Configure Git hooks and branch protection
**Dependencies**: T001
**Estimated Time**: 1 hour
**Acceptance Criteria**:
- [ ] Pre-commit hooks configured
- [ ] Branch protection rules set
- [ ] Commit message template available

### [ ] T004: Testing Infrastructure
**Description**: Set up testing framework and initial test structure
**Dependencies**: T002
**Estimated Time**: 2-3 hours
**Acceptance Criteria**:
- [ ] Testing framework installed
- [ ] Test directory structure created
- [ ] CI pipeline configured

---

## Phase 2: Core Foundation (T005-T008)

### [ ] T005: Data Layer Implementation
**Description**: Implement data models and storage layer
**Dependencies**: T004
**Estimated Time**: 4-6 hours
**Acceptance Criteria**:
- [ ] Data models defined
- [ ] Database schema created
- [ ] Basic CRUD operations working

### [ ] T006: API Layer Setup
**Description**: Create API endpoints and request handling
**Dependencies**: T005
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] API routes defined
- [ ] Request/response models created
- [ ] Error handling implemented

### [ ] T007: Authentication System
**Description**: Implement user authentication and authorization
**Dependencies**: T006
**Estimated Time**: 5-7 hours
**Acceptance Criteria**:
- [ ] User registration/login working
- [ ] JWT tokens implemented
- [ ] Protected routes configured

### [ ] T008: State Management
**Description**: Setup application state management
**Dependencies**: T005, T006
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] State management configured
- [ ] Global state accessible
- [ ] State persistence working

---

## Phase 3: Core Features (T009-T015)

### [ ] T009: Primary Feature Implementation
**Description**: Implement the main feature from User Story 1
**Dependencies**: T007, T008
**Estimated Time**: 8-12 hours
**Acceptance Criteria**:
- [ ] Core functionality working
- [ ] User acceptance criteria met
- [ ] Basic error handling

### [ ] T010: Feature Validation
**Description**: Add form validation and error states
**Dependencies**: T009
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] Input validation implemented
- [ ] Error messages displayed
- [ ] Accessibility compliance

### [ ] T011: Feature Testing
**Description**: Write comprehensive tests for core features
**Dependencies**: T010
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Unit tests written (>90% coverage)
- [ ] Integration tests passing
- [ ] E2E tests for critical paths

### [ ] T012: Performance Optimization
**Description**: Optimize performance bottlenecks
**Dependencies**: T011
**Estimated Time**: 2-3 hours
**Acceptance Criteria**:
- [ ] Performance benchmarks met
- [ ] Bundle size optimized
- [ ] Loading times improved

### [ ] T013: Secondary Feature Implementation
**Description**: Implement supporting features
**Dependencies**: T009
**Estimated Time**: 6-8 hours
**Acceptance Criteria**:
- [ ] Supporting features complete
- [ ] Integration with main feature
- [ ] User workflow smooth

### [ ] T014: Data Import/Export
**Description**: Add data import and export capabilities
**Dependencies**: T013
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Import functionality working
- [ ] Export formats available
- [ ] Data validation during import

### [ ] T015: Search and Filtering
**Description**: Implement search and filtering features
**Dependencies**: T014
**Estimated Time**: 5-6 hours
**Acceptance Criteria**:
- [ ] Search functionality working
- [ ] Filters applied correctly
- [ ] Performance under load

---

## Phase 4: User Experience (T016-T020)

### [ ] T016: Responsive Design
**Description**: Ensure mobile and desktop compatibility
**Dependencies**: T015
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Mobile-first design
- [ ] Tablet layouts optimized
- [ ] Desktop experience polished

### [ ] T017: Accessibility Improvements
**Description**: Implement accessibility features
**Dependencies**: T016
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] WCAG 2.1 AA compliance
- [ ] Keyboard navigation working
- [ ] Screen reader support

### [ ] T018: Error Handling & UX
**Description**: Improve error states and user feedback
**Dependencies**: T017
**Estimated Time**: 2-3 hours
**Acceptance Criteria**:
- [ ] Friendly error messages
- [ ] Loading states clear
- [ ] Recovery options available

### [ ] T019: Onboarding & Help
**Description**: Create user onboarding experience
**Dependencies**: T018
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] Tutorial/intro flow
- [ ] Help documentation
- [ ] Tooltips and guidance

### [ ] T020: Settings & Preferences
**Description**: Implement user settings and preferences
**Dependencies**: T019
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Settings page functional
- [ ] Preferences saved
- [ ] Customization options

---

## Phase 5: Quality Assurance (T021-T025)

### [ ] T021: Comprehensive Testing
**Description**: Complete test suite and fix issues
**Dependencies**: T020
**Estimated Time**: 6-8 hours
**Acceptance Criteria**:
- [ ] All tests passing
- [ ] Coverage >90%
- [ ] Performance tests passing

### [ ] T022: Security Review
**Description**: Security audit and fixes
**Dependencies**: T021
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Security vulnerabilities fixed
- [ ] Dependencies audited
- [ ] Best practices implemented

### [ ] T023: Cross-Browser Testing
**Description**: Test across different browsers
**Dependencies**: T022
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] Chrome, Firefox, Safari compatible
- [ ] Edge support working
- [ ] Mobile browsers tested

### [ ] T024: Load Testing
**Description**: Test application under load
**Dependencies**: T023
**Estimated Time**: 4-5 hours
**Acceptance Criteria**:
- [ ] Handles expected load
- [ ] Performance degrades gracefully
- [ ] Monitoring in place

### [ ] T025: Documentation Complete
**Description**: Final documentation and deployment guide
**Dependencies**: T024
**Estimated Time**: 3-4 hours
**Acceptance Criteria**:
- [ ] API documentation complete
- [ ] Deployment guide ready
- [ ] User manual finished

---

## Task Dependencies

\`\`\`mermaid
graph TD
    T001 --> T002 --> T003 --> T004
    T004 --> T005 --> T006 --> T007
    T005 --> T008
    T007 --> T009 --> T010 --> T011
    T011 --> T012
    T009 --> T013 --> T014 --> T015
    T015 --> T016 --> T017 --> T018 --> T019 --> T020
    T020 --> T021 --> T022 --> T023 --> T024 --> T025
\`\`\`

## Implementation Notes

### Development Guidelines
- Follow established coding standards
- Write tests before implementation (TDD)
- Commit frequently with descriptive messages
- Review code before merging

### Definition of Done
- All acceptance criteria met
- Tests passing with required coverage
- Code reviewed and approved
- Documentation updated
- Performance benchmarks met

---

**Total Estimated Time**: 100-140 hours
**Suggested Team Size**: 2-3 developers
**Timeline**: 3-4 weeks with 2-3 developers

*Last Updated: $(date +%Y-%m-%d)*
EOF

echo -e "${GREEN}✅ Task breakdown generated successfully!${NC}"
echo -e "${GREEN}📁 Tasks file: $TASKS_FILE${NC}"
echo ""
echo -e "${BLUE}Task Summary:${NC}"
echo -e "   • Total Tasks: 25"
echo -e "   • Phase 1 (Setup): 4 tasks"
echo -e "   • Phase 2 (Foundation): 4 tasks"
echo -e "   • Phase 3 (Core Features): 7 tasks"
echo -e "   • Phase 4 (UX): 5 tasks"
echo -e "   • Phase 5 (QA): 5 tasks"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "1. Review task breakdown: ${YELLOW}cat $TASKS_FILE${NC}"
echo -e "2. Create quality checklists: ${YELLOW}/sdd.checklist <type>${NC}"
echo -e "3. Begin implementation: ${YELLOW}/sdd.implement${NC}"