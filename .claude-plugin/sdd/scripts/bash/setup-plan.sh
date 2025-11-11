#!/bin/bash
# Spec-Driven Development: Setup Implementation Plan Script
# Usage: ./setup-plan.sh --json

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Parse arguments
USE_JSON=false
if [[ "$1" == "--json" ]]; then
    USE_JSON=true
fi

# Configuration
FEATURE_BRANCH=${SPECIFY_FEATURE:-$(git branch --show-current 2>/dev/null || echo "current")}
SPECS_DIR="specs"
FEATURE_DIR="$SPECS_DIR/$FEATURE_BRANCH"
SPEC_FILE="$FEATURE_DIR/spec.md"
PLAN_FILE="$FEATURE_DIR/plan.md"
CONSTITUTION_FILE=".specify/memory/constitution.md"

# Validation
if [[ ! -f "$SPEC_FILE" ]]; then
    if [ "$USE_JSON" = true ]; then
        echo '{"error": "Specification file not found. Run /sdd.specify first."}'
    else
        echo -e "${RED}❌ Specification file not found: $SPEC_FILE${NC}"
        echo -e "${YELLOW}💡 Please run '/sdd.specify <description>' first${NC}"
    fi
    exit 1
fi

# Create feature directory
mkdir -p "$FEATURE_DIR"
mkdir -p "$(dirname "$CONSTITUTION_FILE")"

# Create constitution if it doesn't exist
if [[ ! -f "$CONSTITUTION_FILE" ]]; then
    cat > "$CONSTITUTION_FILE" << 'EOF'
# Project Constitution

## Code Quality Principles
- Maintain test coverage above 80%
- Use meaningful variable names
- Document complex algorithms
- Follow language-specific conventions

## Architecture Guidelines
- Prefer composition over inheritance
- Keep functions under 50 lines
- Separate business logic from UI
- Use framework features directly

## Testing Standards
- Write unit tests before implementation (TDD)
- Integration tests for all API endpoints
- End-to-end tests for critical user flows

## Performance Requirements
- Response time <50ms for user interactions
- Load time <2s for initial page load
- Support offline functionality where applicable

## User Experience Principles
- Responsive design for mobile and desktop
- Accessibility compliance (WCAG 2.1 AA)
- Progressive enhancement
- Consistent interaction patterns
EOF
fi

# Create plan.md from template
cat > "$PLAN_FILE" << 'EOF'
# Implementation Plan: {FEATURE_TITLE}

**Feature**: {FEATURE_BRANCH}
**Created**: {CREATED_DATE}
**Status**: Draft

## Technology Stack

{TECH_STACK_DESCRIPTION}

### Core Technologies
- **Frontend**: {FRONTEND_TECH}
- **Backend**: {BACKEND_TECH}
- **Database**: {DATABASE_TECH}
- **Testing**: {TESTING_TECH}
- **Deployment**: {DEPLOYMENT_TECH}

## Architecture Overview

{ARCHITECTURE_DESCRIPTION}

### System Components
{SYSTEM_COMPONENTS}

### Data Flow
{DATA_FLOW}

## Phase 0: Research & Validation

### Technology Research
- {RESEARCH_TOPIC_1}
- {RESEARCH_TOPIC_2}
- {RESEARCH_TOPIC_3}

### Proof of Concept
- {POC_REQUIREMENTS}

## Phase 1: Foundation

### Project Setup
- {SETUP_TASK_1}
- {SETUP_TASK_2}
- {SETUP_TASK_3}

### Core Infrastructure
- {INFRASTRUCTURE_TASK_1}
- {INFRASTRUCTURE_TASK_2}

## Phase 2: Core Features

### Feature Implementation
- {CORE_FEATURE_1}
- {CORE_FEATURE_2}
- {CORE_FEATURE_3}

## Phase 3: Integration & Polish

### Integration
- {INTEGRATION_TASK_1}
- {INTEGRATION_TASK_2}

### Testing & Quality
- {TESTING_TASK_1}
- {TESTING_TASK_2}

## Data Model

### Entity Relationships
{DATA_MODEL_DESCRIPTION}

### Schema Definitions
{SCHEMA_DEFINITIONS}

## API Contracts (if applicable)

### REST Endpoints
{API_ENDPOINTS}

### Data Structures
{DATA_STRUCTURES}

## Performance Considerations

### Optimization Strategies
{PERFORMANCE_STRATEGIES}

### Monitoring & Metrics
{MONITORING_METRICS}

## Security Considerations

### Authentication & Authorization
{SECURITY_AUTH}

### Data Protection
{SECURITY_DATA}

## Development Guidelines

### Code Standards
{CODE_STANDARDS}

### Review Process
{REVIEW_PROCESS}

## Deployment Strategy

### Environment Setup
{DEPLOYMENT_ENV}

### CI/CD Pipeline
{CICD_PIPELINE}

---

**Constitution Compliance**: ✅ Aligned with project principles
**Dependencies**: {DEPENDENCIES_LIST}
**Risks**: {RISKS_ASSESSMENT}
EOF

# Extract feature title from spec
FEATURE_TITLE=$(grep "^# Feature Specification:" "$SPEC_FILE" | sed 's/# Feature Specification: //')

# Replace placeholders
sed -i "s/{FEATURE_TITLE}/${FEATURE_TITLE}/g" "$PLAN_FILE"
sed -i "s/{FEATURE_BRANCH}/${FEATURE_BRANCH}/g" "$PLAN_FILE"
sed -i "s/{CREATED_DATE}/$(date +%Y-%m-%d)/g" "$PLAN_FILE"

# Create research.md
cat > "$FEATURE_DIR/research.md" << EOF
# Research Notes: $FEATURE_TITLE

## Technology Decisions

### Frontend Framework
**Decision**: {FRONTEND_DECISION}
**Rationale**: {FRONTEND_RATIONALE}
**Alternatives Considered**: {FRONTEND_ALTERNATIVES}

### Database Choice
**Decision**: {DATABASE_DECISION}
**Rationale**: {DATABASE_RATIONALE}
**Alternatives Considered**: {DATABASE_ALTERNATIVES}

## Performance Research

### Benchmark Targets
- {PERFORMANCE_TARGET_1}
- {PERFORMANCE_TARGET_2}

### Optimization Techniques
- {OPTIMIZATION_TECHNIQUE_1}
- {OPTIMIZATION_TECHNIQUE_2}

---

*Last Updated: $(date +%Y-%m-%d)*
EOF

# Output JSON if requested
if [ "$USE_JSON" = true ]; then
    cat << EOF
{
  "FEATURE_SPEC": "$(pwd)/$SPEC_FILE",
  "IMPL_PLAN": "$(pwd)/$PLAN_FILE",
  "SPECS_DIR": "$(pwd)/$FEATURE_DIR",
  "BRANCH": "$FEATURE_BRANCH",
  "HAS_GIT": "$(git rev-parse --git-dir > /dev/null 2>&1 && echo 'true' || echo 'false')"
}
EOF
else
    echo -e "${GREEN}✅ Implementation plan created successfully!${NC}"
    echo -e "${GREEN}📁 Plan file: $PLAN_FILE${NC}"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo -e "1. Review the plan: ${YELLOW}cat $PLAN_FILE${NC}"
    echo -e "2. Generate tasks: ${YELLOW}/sdd.tasks${NC}"
fi