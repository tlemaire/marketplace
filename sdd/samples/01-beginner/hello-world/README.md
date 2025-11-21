# Hello World Sample - Beginner Level (SDD + TDD)

This beginner SDD + TDD example demonstrates creating a simple static website with basic unit testing and no external dependencies. Perfect for learning the combined SDD + TDD methodology or creating quick static pages with quality assurance.

## Enhanced SDD + TDD Commands Used
```bash
/sdd.constitution "Simple, no dependencies, fast loading, well-tested"
/sdd.specify "Create a simple landing page"
/sdd.tdd.specify "unit"                              # 🆕 Create test specifications
/sdd.plan "HTML5, CSS3, vanilla JavaScript"
/sdd.tdd.design "jest"                               # 🆕 Design test architecture
/sdd.tasks
/sdd.tdd.implement unit hello-world                  # 🆕 Implement with TDD
/sdd.tdd.coverage --threshold 70                    # 🆕 Monitor coverage
```

## 🧪 TDD Integration Features

### Test Specifications
- **Unit Test Requirements**: Core functionality testing with Jest
- **Test Architecture**: Simple Jest setup with 70% coverage target
- **Quality Gates**: Automated testing with coverage validation

### Testing Workflow
1. **RED**: Write failing tests for HTML content, CSS styles, and JavaScript behavior
2. **GREEN**: Implement minimal functionality to make tests pass
3. **REFACTOR**: Improve code quality while maintaining test coverage

### Generated TDD Files (NEW)
- **[tdd-spec.md](specs/001-hello-world-landing/tdd-spec.md)** - Test specifications and requirements
- **[tdd-architecture.md](specs/001-hello-world-landing/tdd-architecture.md)** - Test architecture and Jest setup
- **[checklists/testing.md](specs/001-hello-world-landing/checklists/testing.md)** - Testing quality checklist

## SDD-Generated Files
This sample demonstrates the complete SDD methodology with the following generated files:

### Core SDD Files (in `specs/001-hello-world-landing/`)
- **[spec.md](specs/001-hello-world-landing/spec.md)** - Basic requirements with 3 user stories
- **[plan.md](specs/001-hello-world-landing/plan.md)** - Simple static site architecture
- **[tasks.md](specs/001-hello-world-landing/tasks.md)** - 5 straightforward implementation tasks (1 hour total)

### Supporting Documentation
- **[research.md](specs/001-hello-world-landing/research.md)** - Technical research and decision rationale
- **[data-model.md](specs/001-hello-world-landing/data-model.md)** - Content structure and data organization
- **[quickstart.md](specs/001-hello-world-landing/quickstart.md)** - Development setup and implementation guide

### Project Configuration
- **[.env.example](specs/001-hello-world-landing/.env.example)** - Environment variables template
- **[Makefile](specs/001-hello-world-landing/Makefile)** - Development automation commands

### Quality Assurance (Enhanced with Testing)
- **[checklists/](specs/001-hello-world-landing/checklists/)** - Comprehensive quality checklists:
  - **[requirements.md](specs/001-hello-world-landing/checklists/requirements.md)** - Requirements validation
  - **[testing.md](specs/001-hello-world-landing/checklists/testing.md)** - 🆕 Testing quality gates (NEW)
  - **[ux.md](specs/001-hello-world-landing/checklists/ux.md)** - User experience testing
  - **[performance.md](specs/001-hello-world-landing/checklists/performance.md)** - Performance benchmarks
  - **[accessibility.md](specs/001-hello-world-landing/checklists/accessibility.md)** - Accessibility compliance
  - **[security.md](specs/001-hello-world-landing/checklists/security.md)** - Security validation

### TDD-Specific Files (NEW)
- **[tdd-spec.md](specs/001-hello-world-landing/tdd-spec.md)** - Test specifications and unit testing requirements
- **[tdd-architecture.md](specs/001-hello-world-landing/tdd-architecture.md)** - Jest test architecture and configuration

### SDD Enhanced Memory System
- **[.specify/memory/constitution.md](.specify/memory/constitution.md)** - Project principles and quality standards (authoritative)

## Key Characteristics (Enhanced with TDD)
- **Complexity**: Beginner
- **Time Estimate**: 1.5 hours (including testing setup)
- **Technology**: HTML5, CSS3, vanilla JavaScript, Jest
- **Dependencies**: Jest for testing (lightweight)
- **Test Coverage**: 70%+ target for unit tests
- **Perfect For**: Learning SDD + TDD, simple projects with quality assurance, building testing habits

## 🎯 Learning Objectives (NEW)

### SDD Skills
- Create clear specifications from simple requirements
- Design technical architecture for static sites
- Organize implementation tasks effectively
- Apply KISS principles consistently

### TDD Skills (NEW)
- Understand Red-Green-Refactor development cycle
- Write effective unit tests for JavaScript functions
- Set up Jest testing configuration
- Monitor test coverage and quality gates
- Build test-first development habits

### Quality Assurance Skills
- Validate requirements systematically
- Apply quality checklists consistently
- Ensure code quality through automated testing
- Document quality decisions clearly

## What You'll Build (with Testing)

A clean, simple landing page featuring:

### Core Features
- **Headline Section**: Clear value proposition with responsive typography
- **Call-to-Action**: Prominent button or contact link
- **Basic Information**: Essential details about the project or service
- **Mobile Responsive**: Works perfectly on all devices

### Technical Implementation
- **Single HTML file**: Self-contained with embedded CSS and minimal JavaScript
- **Semantic HTML5**: Proper structure with header, main, and footer
- **Modern CSS**: Flexbox/Grid for responsive layout with custom properties
- **Progressive Enhancement**: Works without JavaScript, enhanced with it

### 🧪 Testing Implementation (NEW)
- **Unit Tests**: JavaScript functionality testing with Jest
- **Content Tests**: HTML structure and content validation
- **Style Tests**: CSS class application and responsive behavior
- **Coverage Reports**: 70%+ test coverage with automated monitoring

## Learning Objectives (Enhanced with TDD)
This simple sample demonstrates:

### SDD Fundamentals
- Basic SDD workflow and documentation structure
- Specification writing for simple projects
- Static site development with web standards
- Mobile-first responsive design principles
- Performance optimization for fast loading

### 🆕 TDD Fundamentals (NEW)
- Test-first development mindset and workflow
- Red-Green-Refactor cycle practical application
- JavaScript unit testing with Jest framework
- Test coverage monitoring and quality gates
- Building sustainable testing habits

### Quality Assurance Integration
- How testing integrates with specification-driven development
- Quality gates and automated validation
- Documentation for testing requirements and architecture
- Progressive learning of testing concepts alongside development

## Development Approach

### KISS Principles Applied
- **Single file solution**: No build tools or complex setup
- **Vanilla web technologies**: No frameworks or libraries
- **Direct implementation**: No abstraction layers needed
- **Simple deployment**: Just drop the HTML file on any web server

### YAGNI Principles Applied
- **No CMS**: Static content is sufficient
- **No database**: No user data to store
- **No authentication**: Public content only
- **No analytics**: Basic functionality is priority

## Technical Architecture
- **HTML5**: Semantic structure and accessibility
- **CSS3**: Modern styling with custom properties for theming
- **Vanilla JavaScript**: Minimal interactivity (mobile menu, smooth scrolling)
- **No Build Process**: Direct development in browser
- **Zero Dependencies**: Self-contained implementation

## Implementation Steps
1. **Setup** (15 minutes): Create HTML structure with semantic elements
2. **Styling** (30 minutes): Implement responsive CSS with mobile-first approach
3. **Enhancement** (15 minutes): Add JavaScript for progressive enhancement
4. **Testing** (10 minutes): Verify cross-browser compatibility and responsiveness
5. **Deployment** (10 minutes): Simple file upload or GitHub Pages

## SDD-Compliant File Structure
```
01-beginner/hello-world/
├── README.md                                    # This file - project overview
├── index.html                                   # Complete single-file website (to be implemented)
├── .specify/                                    # 🆕 SDD Enhanced Memory System
│   └── memory/
│       └── constitution.md                      # Project principles and quality standards (authoritative)
└── specs/                                       # Complete SDD-generated specifications
    └── 001-hello-world-landing/
        ├── spec.md                               # Complete functional specification
        ├── plan.md                               # Detailed technical architecture
        ├── tasks.md                              # 5 implementation tasks
        ├── research.md                           # Technical research and decisions
        ├── data-model.md                         # Content structure and data models
        ├── quickstart.md                         # Development setup and implementation guide
        ├── .env.example                          # Environment variables template (project-specific)
        ├── Makefile                              # Development automation (project-specific)
        └── checklists/                           # Quality assurance checklists
            ├── requirements.md                   # Requirements validation
            ├── ux.md                            # User experience testing
            ├── performance.md                    # Performance benchmarks
            ├── accessibility.md                  # Accessibility compliance
            └── security.md                       # Security validation
```

## What Makes This SDD-Compliant
- **Project-Specific Configuration**: .env.example and Makefile in specs/ directory
- **Enhanced Memory System**: .specify/memory/constitution.md for project principles
- **Comprehensive Documentation**: Research, data-model, and quickstart guides
- **Quality Assurance**: Complete checklists for all aspects
- **Proper SDD Structure**: Follows `specs/XXX-feature-name/` naming convention
- **Total Files**: 11 files demonstrating complete SDD methodology

## Result
A fast-loading, mobile-friendly landing page that demonstrates professional web development using only web standards. Perfect for portfolios, event pages, product launches, or personal websites.

This sample shows how SDD scales down beautifully to simple projects while maintaining professional development standards and comprehensive documentation.