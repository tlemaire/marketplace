# SDD + TDD Sample Projects by Complexity Level

This directory contains complete SDD (Spec-Driven Development) sample projects with integrated **TDD (Test-Driven Development)**, organized by complexity level. These examples demonstrate how the enhanced SDD + TDD methodology scales from simple to enterprise applications while maintaining comprehensive testing standards.

## 📊 Quick Complexity Overview

| Level | Project Type | Time Estimate | Experience | Technology Stack | Test Coverage | Files Generated |
|-------|--------------|---------------|-------------|----------------|---------------|---------------|
| **01-Beginner** | Hello World | **1 hour** | Beginner | HTML5, CSS3, JS | Basic Unit Tests | 14 files (🧪+3 TDD) |
| **02-Intermediate** | Portfolio | **2-4 weeks** | Intermediate | Modern Static Site | Unit + Integration | 11 files (🧪+4 TDD) |
| **03-Advanced** | Kanban Board | **6-8 weeks** | Advanced | Full-Stack | Unit + Integration + E2E | 10 files (🧪+4 TDD) |
| **04-Reference** | Authentication | **4-6 weeks** | Complete | Enterprise | Comprehensive Testing | 12 files (🧪+5 TDD) |
| **05-Complete Example** | Task Management | **6-8 weeks** | Advanced | Modern Full-Stack | Full TDD Pipeline | 24 files (🧪+5 TDD) |

## 🎯 Choose Your Starting Point

### 🟢 **01-Beginner Level** - Start Here
Perfect for:
- Learning SDD + TDD methodology
- First-time users
- Simple static projects with basic testing
- Understanding basic workflow with test-first development
- 🧪 **Testing Focus**: Basic unit testing with 70%+ coverage

**Sample Projects:**
- **Hello World**: Simple text display
- Basic landing pages
- Personal intro sites
- Learning exercises

### 🟡 **02-Intermediate Level** - Skill Building
Perfect for:
- Freelancers building portfolios with automated testing
- Web developers expanding skills with TDD practices
- Personal branding projects with quality assurance
- Small business websites with comprehensive testing
- 🧪 **Testing Focus**: Unit + Integration testing with 80%+ coverage

**Sample Projects:**
- **Portfolio Website**: Professional project showcase
- Agency websites with multiple pages
- Personal blogs with content management
- Small e-commerce sites

### 🔴 **03-Advanced Level** - Team Projects
Perfect for:
- Development teams practicing TDD
- Startup projects with quality requirements
- Enterprise applications with comprehensive testing
- Complex collaborative tools with automated quality gates
- 🧪 **Testing Focus**: Unit + Integration + E2E testing with 85%+ coverage

**Sample Projects:**
- **Kanban Board**: Project management system
- Team collaboration platforms
- Customer support systems
- Enterprise workflow tools

### 🔵 **04-Reference Level** - Complete Feature Set
Perfect for:
- Understanding full SDD + TDD capabilities
- Enterprise requirement examples with security testing
- Complex system design patterns with comprehensive test coverage
- Team workflow standards with automated quality gates
- 🧪 **Testing Focus**: Comprehensive testing including security and performance with 90%+ coverage

**Sample Projects:**
- **Authentication System**: User management features
- Full-scale application frameworks
- Enterprise security standards
- Production-ready architecture

### 🟣 **05-Complete Example** - Comprehensive Real-World Application
Perfect for:
- Learning the complete SDD + TDD workflow end-to-end
- Understanding real-world complexity management with automated testing
- Studying comprehensive documentation structure with test coverage reports
- Reference for enterprise-scale applications with full TDD pipeline
- 🧪 **Testing Focus**: Complete TDD pipeline with coverage monitoring, CI/CD integration, and quality reporting

**Sample Project:**
- **Collaborative Task Management Platform**: Complete multi-tenant application with real-time collaboration, comprehensive documentation, and production-ready configuration. This is the most complete example showing all SDD artifacts in proper directory structure.

---

## 📁 Directory Structure

```
samples/
├── README.md                           # This file - overview and guide
├── 01-beginner/                       # Simple projects (1 hour)
│   └── hello-world/
│       ├── README.md
│       ├── .specify/                   # 🆕 SDD Enhanced Memory System
│       │   └── memory/
│       │       └── constitution.md     # Project principles and standards (authoritative)
│       └── specs/                      # Complete SDD-generated specifications
│           └── 001-hello-world-landing/
│               ├── spec.md              # Complete functional specification
│               ├── plan.md              # Detailed technical architecture
│               ├── tasks.md             # 5 implementation tasks
│               ├── research.md          # Technical research and decisions
│               ├── data-model.md        # Data structures and information architecture
│               ├── quickstart.md        # Development setup guide
│               ├── .env.example         # Environment variables template (project-specific)
│               ├── Makefile             # Development automation (project-specific)
│               ├── tdd-spec.md          # 🆕 Test specifications and requirements
│               ├── tdd-architecture.md  # 🆕 Test architecture and framework setup
│               └── checklists/          # Quality assurance checklists
│                   ├── requirements.md  # Requirements validation
│                   ├── testing.md       # 🆕 Testing quality gates (NEW)
│                   ├── ux.md           # User experience testing
│                   ├── performance.md   # Performance benchmarks
│                   ├── accessibility.md # Accessibility compliance
│                   └── security.md      # Security validation
├── 02-intermediate/                   # Professional projects (2-4 weeks)
│   └── portfolio/
│       ├── README.md
│       ├── .specify/                   # 🆕 SDD Enhanced Memory System
│       │   └── memory/
│       │       └── constitution.md     # Project principles and standards (authoritative)
│       └── specs/                      # Complete SDD-generated specifications
│           └── 001-portfolio-website/
│               ├── spec.md              # Complete functional specification
│               ├── plan.md              # Detailed technical architecture
│               ├── tasks.md             # 25 implementation tasks
│               ├── research.md          # Technical research and decisions
│               ├── data-model.md        # Content structure and data models
│               ├── quickstart.md        # Development setup guide
│               ├── .env.example         # Environment variables template (project-specific)
│               ├── Makefile             # Development automation (project-specific)
│               ├── tdd-spec.md          # 🆕 Test specifications and requirements
│               ├── tdd-architecture.md  # 🆕 Test architecture and framework setup
│               └── checklists/          # Quality assurance checklists
│                   ├── requirements.md  # Requirements validation
│                   └── testing.md       # 🆕 Testing quality gates (NEW)
├── 03-advanced/                     # Team projects (6-8 weeks)
│   └── kanban/
│       ├── README.md
│       ├── .specify/                   # 🆕 SDD Enhanced Memory System
│       │   └── memory/
│       │       └── constitution.md     # Project principles and standards (authoritative)
│       └── specs/                      # Complete SDD-generated specifications
│           └── 001-kanban-board/
│               ├── spec.md              # Complete functional specification
│               ├── plan.md              # Detailed technical architecture
│               ├── tasks.md             # 25 implementation tasks
│               ├── research.md          # Technical research and decisions
│               ├── data-model.md        # Database schema and data models
│               ├── quickstart.md        # Development setup guide
│               ├── .env.example         # Environment variables template (project-specific)
│               ├── Makefile             # Development automation (project-specific)
│               ├── tdd-spec.md          # 🆕 Test specifications and requirements
│               ├── tdd-architecture.md  # 🆕 Test architecture and framework setup
└── 04-reference/                      # Complete examples (4-6 weeks)
    └── authentication/
        ├── README.md
        └── specs/                      # Complete SDD-generated specifications
            └── 001-authentication-system/
                ├── spec.md              # Complete functional specification
                ├── plan.md              # Detailed technical architecture
                ├── tasks.md             # 25 implementation tasks
                ├── research.md          # Technical research and decisions
                ├── data-model.md        # Database schema and data models
                ├── quickstart.md        # Development setup guide
                ├── .env.example         # Environment variables template (project-specific)
                ├── Makefile             # Development automation (project-specific)
                ├── tdd-spec.md          # 🆕 Test specifications and requirements
                ├── tdd-architecture.md  # 🆕 Test architecture and framework setup
                └── checklists/          # Quality assurance checklists
                    ├── requirements.md  # Requirements validation
                    ├── testing.md       # 🆕 Testing quality gates (NEW)
                    ├── ux.md           # User experience testing
                    ├── performance.md   # Performance benchmarks
                    ├── accessibility.md # Accessibility compliance
                    └── security.md      # Security validation
├── 05-complete-example/                # Comprehensive real-world application (6-8 weeks)
    ├── README.md                       # Project overview and learning guide
    ├── CONSTITUTION.md                 # Project principles and standards (root copy)
    ├── .specify/                        # 🆕 SDD Enhanced Memory System
    │   └── memory/
    │       └── constitution.md         # Project principles and standards (authoritative)
    └── specs/                          # Complete SDD-generated specifications
        └── 001-collaborative-task-management/
            ├── spec.md                  # Complete functional specification
            ├── plan.md                  # Detailed technical architecture
            ├── tasks.md                 # 25 implementation tasks
            ├── research.md              # Technical research and decisions
            ├── data-model.md            # Database schema and data models
            ├── quickstart.md            # Development setup guide
            ├── .env.example             # Environment variables template (project-specific)
            ├── Makefile                 # Development automation (project-specific)
            ├── contracts/               # API contracts and schemas
            │   └── api.json             # OpenAPI specification
            ├── tdd-spec.md              # 🆕 Test specifications and requirements
            ├── tdd-architecture.md      # 🆕 Test architecture and framework setup
            └── checklists/              # Quality assurance checklists
                ├── requirements.md      # Requirements validation
                ├── testing.md           # 🆕 Testing quality gates (NEW)
                ├── ux.md               # User experience testing
                ├── performance.md       # Performance benchmarks
                ├── accessibility.md     # Accessibility compliance
                └── security.md          # Security validation
```

## 🚀 Quick Start by Level

### Start with Hello World + TDD (1 Hour)
```bash
# Try the complete SDD + TDD workflow
/sdd.constitution "Simple, no dependencies, fast loading, well-tested"
/sdd.specify "Create a simple 'Hello World' display"
/sdd.tdd.specify "unit"                              # 🆕 Create test specifications
/sdd.plan "HTML5, CSS3, vanilla JavaScript"
/sdd.tdd.design "jest"                               # 🆕 Design test architecture
/sdd.tasks
/sdd.tdd.implement unit hello-world                  # 🆕 Implement with TDD
/sdd.tdd.coverage --threshold 70                    # 🆕 Monitor coverage
```

### Build a Portfolio with Comprehensive Testing (2-4 Weeks)
```bash
# Create a professional portfolio with automated testing
/sdd.constitution "Professional presentation, SEO optimized, mobile-first, quality assured"
/sdd.specify "Create a portfolio showcasing React and Node.js projects"
/sdd.tdd.specify "unit,integration"                  # 🆕 Create comprehensive test specs
/sdd.plan "Modern web technologies, static hosting, performance optimized"
/sdd.tdd.design "jest,playwright" pyramid            # 🆕 Design full test architecture
/sdd.tasks
/sdd.tdd.implement all portfolio                     # 🆕 Implement with TDD workflow
/sdd.tdd.coverage --format html --threshold 80      # 🆕 Generate coverage reports
```

### Build Team Software with Full TDD Pipeline (6-8 Weeks)
```bash
# Create collaborative project management with enterprise testing
/sdd.constitution "Real-time collaboration, enterprise security, scalability, comprehensive testing"
/sdd.specify "Build collaborative kanban system with team features"
/sdd.tdd.specify "unit,integration,e2e,security"     # 🆕 Complete test specifications
/sdd.plan "React, TypeScript, Node.js, PostgreSQL, Socket.IO"
/sdd.tdd.design "jest,supertest,playwright" pyramid  # 🆕 Enterprise test architecture
/sdd.tasks
/sdd.tdd.implement all kanban-system                 # 🆕 Full TDD implementation
/sdd.tdd.coverage --format lcov --threshold 85       # 🆕 Enterprise coverage monitoring
```

### Study Complete Real-World Application (6-8 Weeks)
```bash
# Examine the complete task management example
cd samples/05-complete-example/
cat README.md                    # Start with project overview
cat CONSTITUTION.md              # Understand project principles
cat specs/001-collaborative-task-management/spec.md    # Study specification
cat specs/001-collaborative-task-management/plan.md    # Review technical plan
cat specs/001-collaborative-task-management/tasks.md   # Examine implementation tasks
```

## 📚 Learning Path

### Step 1: Understand SDD + TDD Basics
1. Read `01-beginner/hello-world/README.md`
2. Examine `specs/001-hello-world-landing/` directory structure with TDD files
3. Study specification, test specifications, plan, and test architecture
4. Try creating your own simple project with test-first development
5. Practice Red-Green-Refactor cycle with basic unit tests

### Step 2: Build Professional Skills with Testing
1. Study `02-intermediate/portfolio/` examples with testing integration
2. Examine Jekyll-based static site architecture with integration tests
3. Learn intermediate specification writing and test specification creation
4. Practice with real-world projects using unit + integration testing
5. Master test coverage monitoring and quality gates

### Step 3: Scale to Team Development with Enterprise Testing
1. Explore `03-advanced/kanban/` enterprise features with comprehensive testing
2. Study real-time collaboration architecture and database design with full test coverage
3. Understand full-stack development with TypeScript, Socket.IO, and E2E testing
4. Apply to your team projects with automated testing pipelines
5. Master enterprise testing strategies including security and performance testing

### Step 4: Master Complete SDD + TDD Workflow
1. Review `04-reference/authentication/` for full testing capabilities
2. Study enterprise security patterns with comprehensive security testing
3. Understand complete documentation, deployment automation, and test reporting
4. Apply to large-scale applications with full TDD pipelines
5. Master production-ready testing strategies with CI/CD integration

### Step 5: Study Complete Real-World Application (NEW)
1. Examine `05-complete-example/` for complete SDD + TDD implementation
2. Study full TDD pipeline with coverage monitoring and quality gates
3. Understand enterprise-scale testing with comprehensive reporting
4. Master advanced testing patterns and best practices
5. Apply to mission-critical applications with complete quality assurance

## 🔍 What Each Sample Demonstrates

### Hello World Sample (01-Beginner)
- **🧪 TDD Basics**: Introduction to test-first development with simple unit tests
- **KISS Principles**: Simplicity focus with no dependencies
- **SDD + TDD Structure**: Complete specs/ directory with test specifications and architecture
- **Basic Specification**: Simple user stories and acceptance criteria
- **Test Architecture**: Basic Jest setup with 70%+ coverage targets
- **Task Organization**: 5 straightforward tasks integrated with testing tasks
- **Comprehensive Documentation**: Research, data-model, quickstart, and testing guides

### Portfolio Sample (02-Intermediate)
- **🧪 Professional Testing**: Unit + Integration testing with 80%+ coverage
- **Professional Standards**: SEO optimization and performance focus with testing validation
- **Jekyll Integration**: Static site generator with Markdown content and build testing
- **Rich Specifications**: Content management features and project showcase with test scenarios
- **Test Architecture**: Jest + Playwright setup with comprehensive coverage reporting
- **Modern Planning**: Static hosting with professional deployment and automated testing
- **Quality Gates**: Automated testing integration with development workflow

### Kanban Sample (03-Advanced)
- **🧪 Enterprise Testing**: Unit + Integration + E2E testing with 85%+ coverage
- **Team Collaboration**: Real-time features with Socket.IO integration and collaborative testing
- **Full-Stack Architecture**: React + TypeScript + Node.js + PostgreSQL with comprehensive test coverage
- **Complex Requirements**: User management, permissions, real-time updates with security testing
- **Test Architecture**: Jest + Supertest + Playwright with enterprise test strategies
- **Advanced Planning**: Microservices-ready architecture patterns with service-level testing
- **Quality Assurance**: Automated testing pipelines with performance and accessibility testing

### Authentication Sample (04-Reference)
- **🧪 Comprehensive Testing**: Full testing suite including security and performance with 90%+ coverage
- **Complete Feature Set**: Full authentication and authorization ecosystem with comprehensive test coverage
- **Enterprise Standards**: Security best practices, compliance, and security testing
- **Test Architecture**: Complete testing pipeline with Jest, Supertest, and security testing tools
- **Production Ready**: Environment setup, automation, deployment, and testing integration
- **Quality Assurance**: Comprehensive checklists including testing, security, and performance validation
- **Reference Implementation**: Industry-standard authentication patterns with full test coverage

## 💡 Choosing the Right Sample

### For Learning SDD + TDD:
1. **Start**: Hello World to understand basics + TDD fundamentals
2. **Practice**: Portfolio to build skills with integration testing
3. **Explore**: Kanban for team concepts with enterprise testing
4. **Master**: Authentication for complete understanding with security testing
5. **Complete**: Study Complete Example for full TDD pipeline mastery

### For Projects with Quality Requirements:
1. **Personal**: Hello World → Portfolio progression with automated testing
2. **Freelance**: Portfolio → Intermediate samples with comprehensive testing
3. **Team**: Intermediate → Advanced progression with full testing pipeline
4. **Enterprise**: Advanced → Reference examples with production-ready testing
5. **Mission-Critical**: Complete Example for full quality assurance implementation

### For Learning Styles with Testing Focus:
1. **Visual Learner**: Start with Hello World + TDD to see immediate test feedback
2. **Practical Learner**: Start with Portfolio + integration testing for real-world skills
3. **Systems Thinker**: Start with Kanban + enterprise testing for complex systems
4. **Quality-Focused**: Study Authentication reference for comprehensive testing
5. **Complete Learner**: Study Complete Example for full SDD + TDD workflow mastery

## 🎓 Sample File Types by Level (Updated with TDD)

| Level | SPECIFICATION | PLAN | TASKS | TDD Files | Testing Coverage |
|-------|----------------|------|------|-----------|-----------------|
| **Beginner** | Basic requirements | Simple architecture | 5 tasks | TDD Spec, TDD Architecture, Testing Checklist | Unit Tests (70%+) |
| **Intermediate** | Detailed requirements | Modern architecture | 25 tasks | TDD Spec, TDD Architecture, Testing Checklist | Unit + Integration (80%+) |
| **Advanced** | Enterprise requirements | Full-stack architecture | 25 tasks | TDD Spec, TDD Architecture, Testing Checklist | Unit + Integration + E2E (85%+) |
| **Reference** | Complete requirements | Full-stack architecture | 25 tasks | TDD Spec, TDD Architecture, Testing Checklist | Comprehensive Testing (90%+) |
| **Complete** | Complete requirements | Full-stack architecture | 25 tasks | TDD Spec, TDD Architecture, Testing Checklist | Full TDD Pipeline (90%+) |

## 🏆 Why This Organization?

### **Progressive Learning**
- Each level builds on previous knowledge
- Gradual complexity increase
- Clear skill progression path
- 🆕 **Progressive Testing**: Testing complexity grows with project complexity

### **Practical Application**
- Real-world project examples
- Different user types addressed
- Industry-standard patterns
- 🆕 **Real-World Testing**: Testing practices reflect actual industry requirements

### **Flexibility**
- Users can start at appropriate level
- Skip levels if experienced
- Mix and match concepts
- 🆕 **Testing Flexibility**: Choose appropriate testing depth for your needs

### **Complete Coverage**
- From single-page apps to enterprise systems
- From solo projects to team collaboration
- From prototypes to production-ready applications
- 🆕 **Quality Assurance**: Complete testing coverage from basic unit tests to enterprise testing pipelines

This organization makes SDD + TDD accessible to users at all skill levels while demonstrating how the methodology scales with project complexity and maintains high quality standards through comprehensive testing.

## 🎯 TDD Integration Benefits by Level

### **Beginner**: Learn Testing Fundamentals
- Understand Red-Green-Refactor cycle
- Practice basic unit testing
- Build testing habits from the start

### **Intermediate**: Professional Testing Practices
- Master integration testing
- Implement test coverage monitoring
- Build quality gates into development workflow

### **Advanced**: Enterprise Testing Strategies
- Comprehensive test architecture design
- Security and performance testing
- Automated testing pipelines

### **Reference**: Production-Ready Testing
- Full test suite implementation
- CI/CD integration
- Quality reporting and monitoring

### **Complete**: TDD Mastery
- Complete TDD workflow implementation
- Advanced testing patterns and best practices
- Full quality assurance ecosystem