# SDD + TDD-Compliant Project Structure Template

This template defines the complete **SDD + TDD-compliant** structure that all projects created with enhanced SDD should follow, integrating both specification-driven and test-driven development methodologies.

## Required Directory Structure

```
project-name/
├── README.md                           # 📖 Project overview with SDD + TDD structure explanation
├── .gitignore                          # 🚫 Git ignore patterns for SDD and test files
├── .specify/                           # 🧠 SDD-Enhanced Memory System
│   └── memory/
│       └── constitution.md             # Project principles and quality standards (authoritative)
├── tests/                              # 🧪 Test-Driven Development structure (NEW)
│   ├── unit/                           # Unit tests for individual components
│   │   ├── components/                 # Component unit tests
│   │   ├── services/                   # Service unit tests
│   │   ├── utils/                      # Utility function tests
│   │   └── __mocks__/                  # Mock files for unit testing
│   ├── integration/                    # Integration tests for component interactions
│   │   ├── api/                        # API integration tests
│   │   ├── database/                   # Database integration tests
│   │   └── external-services/          # External service integration tests
│   ├── e2e/                            # End-to-end tests for complete user workflows
│   │   ├── journeys/                   # User journey tests
│   │   ├── pages/                      # Page-level e2e tests
│   │   └── fixtures/                   # Test data and setup
│   ├── performance/                    # Performance and load tests
│   │   ├── load/                       # Load testing scripts
│   │   └── stress/                     # Stress testing scenarios
│   ├── utils/                          # Test utilities and helpers
│   │   ├── helpers/                    # Test helper functions
│   │   ├── fixtures/                   # Test data fixtures
│   │   └── setup/                      # Test setup and teardown
│   ├── coverage/                       # 📊 Coverage reports and analysis
│   └── config/                         # 🛠️ Test configuration files
│       ├── jest.config.js              # Jest configuration
│       ├── playwright.config.js        # Playwright configuration
│       └── test-setup.js               # Global test setup
└── specs/                              # 📋 Complete SDD + TDD-generated specifications
    ├── 001-project-setup/              # Project initialization specification
    │   ├── spec.md                     # Project setup and configuration
    │   ├── plan.md                     # Technical architecture plan
    │   ├── tdd-spec.md                  # 🆕 Project-level test specifications
    │   ├── tdd-architecture.md         # 🆕 Test architecture design
    │   ├── .env.example                # Project environment variables template
    │   ├── Makefile                    # Project development automation
    │   ├── quickstart.md               # Project setup guide
    │   └── checklists/                 # Project quality checklists
    │       ├── requirements.md         # Requirements validation
    │       ├── testing.md              # 🆕 Testing quality gates
    │       ├── ux.md                   # User experience testing
    │       ├── performance.md          # Performance benchmarks
    │       ├── accessibility.md        # Accessibility compliance
    │       └── security.md             # Security validation
    └── [XXX-feature-name]/             # Feature specifications (auto-generated)
        ├── spec.md                     # Functional specification
        ├── plan.md                     # Technical implementation plan
        ├── tasks.md                    # Implementation tasks
        ├── tdd-spec.md                  # 🆕 Feature-level test specifications
        ├── tdd-architecture.md         # 🆕 Feature test architecture
        ├── research.md                 # Technical research
        ├── data-model.md               # Data structures
        ├── quickstart.md               # Feature development setup
        ├── .env.example                # Feature-specific environment variables
        ├── Makefile                    # Feature-specific automation
        └── checklists/                 # Feature quality checklists
            ├── requirements.md         # Feature requirements validation
            ├── testing.md              # 🆕 Feature testing quality gates
            ├── ux.md                   # Feature user experience testing
            ├── performance.md          # Feature performance benchmarks
            ├── accessibility.md        # Feature accessibility compliance
            └── security.md             # Feature security validation
```

## File Content Templates

### Constitution Template (.specify/memory/constitution.md)

```markdown
# [Project Name] Constitution

## Project Principles
[Core values and guiding principles]

### Quality Standards
- **Code Quality**: [Standards for code quality]
- **Testing Requirements**: [Testing approach and coverage]
- **Documentation Standards**: [Documentation requirements]

### Technical Guidelines
- **Technology Stack**: [Approved technologies and frameworks]
- **Architecture Patterns**: [Preferred architectural approaches]
- **Coding Conventions**: [Style and formatting standards]

### Performance Requirements
- **Response Time Targets**: [Performance benchmarks]
- **Scalability Requirements**: [Scalability expectations]
- **Resource Limits**: [Resource usage constraints]

### Security Standards
- **Authentication Requirements**: [Security authentication standards]
- **Data Protection**: [Data security and privacy requirements]
- **Input Validation**: [Security validation requirements]

### User Experience Principles
- **Design Consistency**: [UI/UX guidelines]
- **Accessibility Standards**: [Accessibility requirements]
- **User Testing Requirements**: [UX testing approach]

### Development Workflow
- **Git Process**: [Version control workflow]
- **Code Review Requirements**: [Review and approval process]
- **Release Process**: [Deployment and release procedures]

### Environment Management
- **Configuration Management**: [Environment variable standards]
- **Secrets Management**: [Security for sensitive data]
- **Deployment Environments**: [Environment setup requirements]
```

### Feature Specification Template (specs/XXX-feature-name/spec.md)

```markdown
# Feature Specification: [Feature Name]

## Overview
[Brief description of the feature and its purpose]

## User Stories

### US1: [User Story Title]
**As a** [user type]
**I want** [functionality]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Specific, testable criterion]
- [ ] [Specific, testable criterion]
- [ ] [Specific, testable criterion]

## Functional Requirements

### FR1: [Requirement Title]
[Detailed functional requirement description]

### FR2: [Requirement Title]
[Detailed functional requirement description]

## Non-Functional Requirements

### Performance
- [Performance requirement 1]
- [Performance requirement 2]

### Security
- [Security requirement 1]
- [Security requirement 2]

### Usability
- [Usability requirement 1]
- [Usability requirement 2]

## Acceptance Criteria
[Overall criteria for feature completion]

## Edge Cases and Constraints
[Limitations, error conditions, special cases]

## Dependencies
[External systems, internal dependencies, prerequisites]

## Success Metrics
[How to measure feature success and completion]

## Technical Considerations
[Technical constraints, implementation notes]
```

### Environment Variables Template (.env.example)

```bash
# [Project/Feature Name] Environment Configuration

# Application Configuration
APP_NAME=[project-name]
APP_VERSION=1.0.0
APP_ENVIRONMENT=development
DEBUG=true
LOG_LEVEL=info

# Database Configuration
DATABASE_URL=[database-connection-string]
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=[project-name]_dev
DATABASE_USER=[username]
DATABASE_PASSWORD=[password]

# API Configuration
API_BASE_URL=http://localhost:3000/api
API_VERSION=v1
API_TIMEOUT=30000

# Security Configuration
JWT_SECRET=[jwt-secret-key]
ENCRYPTION_KEY=[encryption-key]
CORS_ORIGINS=http://localhost:3000

# Feature-Specific Configuration
[FEATURE_SPECIFIC_SETTINGS]

# Development Tools
DEV_TOOLS_ENABLED=true
HOT_RELOAD=true
SOURCE_MAPS=true

# Quality Assurance
TEST_MODE_ENABLED=true
COVERAGE_REPORTING=true
LINTING_ENABLED=true
```

### Makefile Template

```makefile
.PHONY: help install setup test clean build deploy lint format

# Default target
help:          ## Show this help message
	@echo "[Project Name] Development Commands"
	@echo "=================================="
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Development setup
install:       ## Install project dependencies
	npm install

setup:         ## Setup development environment
	npm install
	cp .env.example .env
	@echo "✅ Development environment setup complete"
	@echo "📝 Edit .env file with your configuration"

# Development commands
dev:           ## Start development server
	npm run dev

build:         ## Build project for production
	npm run build

test:          ## Run all tests
	npm run test

test-watch:    ## Run tests in watch mode
	npm run test:watch

test-coverage: ## Run tests with coverage report
	npm run test:coverage

# Quality assurance
lint:          ## Run code linting
	npm run lint

lint-fix:      ## Fix linting issues automatically
	npm run lint:fix

format:        ## Format code
	npm run format

type-check:    ## Run TypeScript type checking
	npm run type-check

# Security and validation
security-check: ## Run security vulnerability check
	npm audit
	sdd validate

# Documentation
docs:          ## Generate documentation
	npm run docs

docs-serve:    ## Serve documentation locally
	npm run docs:serve

# Deployment
deploy-dev:    ## Deploy to development environment
	npm run deploy:dev

deploy-staging: ## Deploy to staging environment
	npm run deploy:staging

deploy-prod:   ## Deploy to production environment
	npm run deploy:prod

# Database operations
db-migrate:    ## Run database migrations
	npm run db:migrate

db-seed:       ## Seed database with initial data
	npm run db:seed

db-reset:      ## Reset database
	npm run db:reset

# Cleanup
clean:         ## Clean build artifacts
	rm -rf node_modules/.cache
	rm -rf dist
	rm -rf coverage

clean-all: clean ## Clean all dependencies and artifacts
	rm -rf node_modules

# Quick commands
quick-test:    ## Quick test for development
	npm run test -- --watchAll=false

quick-build:   ## Quick build without optimization
	npm run build:dev

# SDD Integration
sdd-validate:  ## Validate SDD-compliance
	sdd validate

sdd-status:    ## Show SDD project status
	@echo "📋 SDD Project Status"
	@echo "===================="
	@echo "📁 Specs Directory: $(shell ls -1 specs/ 2>/dev/null | wc -l) features"
	@echo "🧠 Constitution: $(shell test -f .specify/memory/constitution.md && echo '✅' || echo '❌')"
	@echo "📊 Last Updated: $(shell date)"
```

### Quality Checklist Template (checklists/requirements.md)

```markdown
# Requirements Validation Checklist

## Functional Requirements Validation

### User Stories Implementation
- [ ] **US1: [Story Title]** - Fully implemented with all acceptance criteria
- [ ] **US2: [Story Title]** - Fully implemented with all acceptance criteria
- [ ] **US3: [Story Title]** - Fully implemented with all acceptance criteria

### Feature Completeness
- [ ] All functional requirements implemented
- [ ] Edge cases handled appropriately
- [ ] Error conditions covered
- [ ] Integration points tested

### Business Logic Validation
- [ ] Business rules implemented correctly
- [ ] Data validation working properly
- [ ] Workflow logic functioning as expected
- [ ] Calculations and algorithms verified

## Non-Functional Requirements Validation

### Performance Requirements
- [ ] Response time targets met
- [ ] Load testing completed
- [ ] Resource usage within limits
- [ ] Scalability requirements satisfied

### Security Requirements
- [ ] Authentication implemented correctly
- [ ] Authorization working properly
- [ ] Data encryption applied
- [ ] Input validation comprehensive

### Usability Requirements
- [ ] User interface intuitive and responsive
- [ ] Accessibility standards met
- [ ] Error messages clear and helpful
- [ ] User workflows streamlined

## Integration Validation

### External System Integration
- [ ] API connections working correctly
- [ ] Data synchronization verified
- [ ] Error handling for external failures
- [ ] Rate limiting and throttling implemented

### Internal System Integration
- [ ] Database integration tested
- [ ] Cache layer functioning correctly
- [ ] Message processing verified
- [ ] Background jobs working properly

## Testing Validation

### Test Coverage
- [ ] Unit tests covering all critical paths
- [ ] Integration tests covering major workflows
- [ ] End-to-end tests covering user scenarios
- [ ] Performance tests completed

### Test Quality
- [ ] Test assertions comprehensive and meaningful
- [ ] Test data realistic and comprehensive
- [ ] Test environment stable and repeatable
- [ ] Automated testing pipeline functional

## Documentation Validation

### Technical Documentation
- [ ] API documentation complete and accurate
- [ ] Code documentation comprehensive
- [ ] Architecture diagrams updated
- [ ] Deployment procedures documented

### User Documentation
- [ ] User guide complete and accurate
- [ ] Troubleshooting guide helpful
- [ ] Release notes comprehensive
- [ ] Training materials available

## Acceptance Criteria Validation

### Completion Criteria
- [ ] All acceptance criteria met
- [ ] Stakeholder approval obtained
- [ ] Quality gates passed
- [ ] Production readiness verified

### Quality Metrics
- [ ] Code quality standards met
- [ ] Test coverage targets achieved
- [ ] Performance benchmarks satisfied
- [ ] Security requirements fulfilled

## Overall Assessment

### Requirements Completeness: [Score]%
- Functional Requirements: [Score]%
- Non-Functional Requirements: [Score]%
- Integration Requirements: [Score]%

### Implementation Quality: [Score]%
- Code Quality: [Score]%
- Test Coverage: [Score]%
- Documentation: [Score]%

### Readiness Assessment: [Score]%
- Technical Readiness: [Score]%
- Business Readiness: [Score]%
- Operational Readiness: [Score]%

## Issues and Action Items

### Critical Issues (Must Fix Before Release)
- [ ] [Issue description]
- [ ] [Issue description]

### Improvement Opportunities (Should Fix in Future Iteration)
- [ ] [Improvement description]
- [ ] [Improvement description]

### Recommendations for Future Development
- [ ] [Recommendation]
- [ ] [Recommendation]

---

**Validation Completed:** [Date]
**Validated By:** [Name/Role]
**Overall Score:** [Score]%
**Recommendation:** [Approve/Request Changes/Reject]
```

## Implementation Guidelines

### Usage Instructions

1. **Automatic Structure Creation**: SDD commands automatically create this structure
2. **Template Customization**: Modify templates to match project-specific needs
3. **Validation Enforcement**: Use `/sdd.validate` to ensure compliance
4. **Continuous Maintenance**: Regular validation and updates as project evolves

### Customization Guidelines

- **Project-Specific**: Adapt templates while maintaining core structure
- **Technology-Specific**: Include technology-relevant configurations
- **Team-Specific**: Adjust workflows and standards to match team preferences
- **Compliance Requirements**: Ensure templates meet regulatory and organizational requirements

### Integration with SDD Commands

- **Constitution Command**: Creates `.specify/memory/constitution.md`
- **Specify Command**: Creates complete feature structure with all required files
- **Plan Command**: Generates technical plans within SDD structure
- **Tasks Command**: Creates task lists within feature directories
- **Checklist Command**: Generates quality checklists for validation
- **Validate Command**: Ensures ongoing compliance with SDD structure

This template ensures that all projects created with SDD follow consistent, comprehensive, and high-quality structure that supports the complete development lifecycle.