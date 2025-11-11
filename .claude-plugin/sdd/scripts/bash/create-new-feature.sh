#!/bin/bash
# Spec-Driven Development: Create New Feature Script
# Usage: ./create-new-feature.sh "<feature description>"

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
FEATURE_DESCRIPTION="$1"
SPECS_DIR="specs"
MEMORY_DIR=".specify/memory"
FEATURE_NUMBER=$(find "$SPECS_DIR" -maxdepth 1 -type d -name '[0-9][0-9][0-9]-*' 2>/dev/null | wc -l)
NEXT_FEATURE_NUM=$(printf "%03d" $((FEATURE_NUMBER + 1)))

if [[ -z "$FEATURE_DESCRIPTION" ]]; then
    echo -e "${RED}Error: Please provide a feature description${NC}"
    echo "Usage: $0 \"<feature description>\""
    exit 1
fi

# Extract feature name from description (first few words)
FEATURE_NAME=$(echo "$FEATURE_DESCRIPTION" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | head -n1 | awk '{for(i=1;i<=4;i++) printf $i; print ""}' | sed 's/ /-/g' | sed 's/-*$//')
BRANCH_NAME="${NEXT_FEATURE_NUM}-${FEATURE_NAME}"

echo -e "${BLUE}🚀 Creating SDD feature: ${FEATURE_DESCRIPTION}${NC}"
echo -e "${YELLOW}Feature Number: ${NEXT_FEATURE_NUM}${NC}"
echo -e "${YELLOW}Branch Name: ${BRANCH_NAME}${NC}"

# Create directories
mkdir -p "$SPECS_DIR/${BRANCH_NAME}"
mkdir -p "$MEMORY_DIR"

# Create spec.md from template
SPEC_FILE="$SPECS_DIR/${BRANCH_NAME}/spec.md"
cat > "$SPEC_FILE" << 'EOF'
---
# Feature Specification: {FEATURE_TITLE}

**Feature Branch**: `{BRANCH_NAME}`
**Created**: {CREATED_DATE}
**Status**: Draft

## User Scenarios & Testing

### User Story 1 - {PRIMARY_USER_STORY} (Priority: P1)
{PRIMARY_DESCRIPTION}

**Why this priority**: {PRIORITY_RATIONALE}

#### Acceptance Criteria
{ACCEPTANCE_CRITERIA}

#### Testing Scenarios
{TESTING_SCENARIOS}

## Functional Requirements

### FR-001: {REQUIREMENT_1}
{REQUIREMENT_1_DESCRIPTION}

### FR-002: {REQUIREMENT_2}
{REQUIREMENT_2_DESCRIPTION}

### FR-003: {REQUIREMENT_3}
{REQUIREMENT_3_DESCRIPTION}

## Non-Functional Requirements

### Performance
- Response time < {RESPONSE_TIME}ms for all user interactions
- Support up to {MAX_USERS} concurrent users

### Security
- {SECURITY_REQUIREMENT_1}
- {SECURITY_REQUIREMENT_2}

### Accessibility
- WCAG 2.1 AA compliance
- Full keyboard navigation support

## Success Criteria

### SC-001: Functional Completeness
- All user stories implemented and tested
- All functional requirements satisfied

### SC-002: Performance Benchmarks
- {PERFORMANCE_CRITERION_1}
- {PERFORMANCE_CRITERION_2}

### SC-003: Quality Gates
- Test coverage > {COVERAGE_TARGET}%
- Zero critical security vulnerabilities
- Accessibility audit passes

## Out of Scope

{OUT_OF_SCOPE_ITEMS}

## Dependencies

{EXTERNAL_DEPENDENCIES}

---

*Last Updated: {LAST_UPDATED}*
EOF

# Replace placeholders
sed -i "s/{FEATURE_TITLE}/${FEATURE_DESCRIPTION^}/g" "$SPEC_FILE"
sed -i "s/{BRANCH_NAME}/${BRANCH_NAME}/g" "$SPEC_FILE"
sed -i "s/{CREATED_DATE}/$(date +%Y-%m-%d)/g" "$SPEC_FILE"
sed -i "s/{LAST_UPDATED}/$(date +%Y-%m-%d)/g" "$SPEC_FILE"

# Create Git branch if git repository
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${BLUE}📦 Creating Git branch: ${BRANCH_NAME}${NC}"
    git checkout -b "$BRANCH_NAME" 2>/dev/null || {
        echo -e "${YELLOW}Branch might already exist, switching to it...${NC}"
        git checkout "$BRANCH_NAME"
    }
fi

# Set environment variable for current feature
export SPECIFY_FEATURE="$BRANCH_NAME"

# Output JSON for automation
cat << EOF
{
  "BRANCH_NAME": "$BRANCH_NAME",
  "SPEC_FILE": "$(pwd)/$SPEC_FILE",
  "FEATURE_NUM": "$NEXT_FEATURE_NUM",
  "SPECS_DIR": "$(pwd)/$SPECS_DIR/${BRANCH_NAME}",
  "HAS_GIT": "$(git rev-parse --git-dir > /dev/null 2>&1 && echo 'true' || echo 'false')"
}
EOF

echo -e "${GREEN}✅ Feature specification created successfully!${NC}"
echo -e "${GREEN}📁 Spec file: $SPEC_FILE${NC}"
echo -e "${GREEN}🌿 Branch: $BRANCH_NAME${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "1. Review and edit the specification: ${YELLOW}cat $SPEC_FILE${NC}"
echo -e "2. Run clarifications: ${YELLOW}/sdd.clarify${NC}"
echo -e "3. Create implementation plan: ${YELLOW}/sdd.plan '<your tech stack>'${NC}"