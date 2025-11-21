# 📋 Changelog

All notable changes to the marketplace plugins will be documented in this file.

The format is based on **[Keep a Changelog v1.1.0](https://keepachangelog.com/en/1.1.0/)**,
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

## [1.7.0] - 2025-11-21

### 🆕 Added
- Add Python functionality
- **Complete TDD Integration**: Full Test-Driven Development workflow integrated into SDD methodology
- **4 New TDD Commands**: `/sdd.tdd.specify`, `/sdd.tdd.design`, `/sdd.tdd.implement`, `/sdd.tdd.coverage` for comprehensive testing
- **Smart Entry Points**: QUICKSTART.md, COMMANDS.md, HELP.md, START.md for 5-minute getting started experience
- **6 Comprehensive Templates**: TDD workflow, quality gates, project constitution, README templates
- **Interactive Help System**: Problem-oriented guidance with natural language support
- **Visual Command Reference**: Categorized commands with popular combinations and quick tips
- **Progressive Learning Paths**: From beginner (3-step) to enterprise (13-step) workflows
- **35,000+ Lines Documentation**: Complete TDD integration examples and best practices

### 🔄 Changed
- **Enhanced SDD Workflow**: Expanded from 9-step to 13-step with integrated TDD methodology
- **Claude Code Usability**: Reduced cognitive load with smart entry points and progressive disclosure
- **Documentation Overhaul**: Updated all documentation with TDD examples and Red-Green-Refactor guidance
- **Sample Projects Enhancement**: All sample projects now include TDD integration examples
- **Command Organization**: Better categorization and visual reference for improved discoverability

## [1.6.0] - 2025-11-19

### 🆕 Added
- Add Python functionality
- **SDD-Enhanced Memory System**: Complete `.specify/memory/` directory structure with constitution management
- **SDD Structure Validation**: New `/sdd.validate` command for compliance checking and auto-fixing
- **Comprehensive Quality Checklists**: Requirements, UX, performance, accessibility, and security validation templates
- **Complete Sample Projects**: All sample projects restructured to follow SDD methodology with proper specifications
- **Project Configuration Templates**: `.env.example` and `Makefile` templates for all project types
- **Enhanced Commands Structure**: Commands organized into `core/` and `quality/` directories for better organization

### 🔄 Changed
- **Commands Enforcement**: All commands now create and enforce SDD-compliant project structure
- **Constitution Management**: Updated to create `.specify/memory/constitution.md` as primary location
- **Specification Generation**: Enhanced `/sdd.specify` to generate complete feature structures
- **Workflow Integration**: Added validation steps throughout the SDD development workflow
- **Template System**: Comprehensive SDD structure templates for consistent project generation
- **Documentation Organization**: Improved documentation structure and cross-references

## [Unreleased]

### 🔄 Changed
- **SmartCommit Refactor**: Simplify architecture with Claude-native implementation
- Remove Python script complexity in favor of direct Claude execution logic
- Delete unnecessary scripts directory following KISS principles
- Update plugin metadata to version 1.2.0 with streamlined structure
- Enhance command file to leverage Claude's native capabilities for git workflow automation

### 📚 Documentation
- Update documentation
- Update documentation
- Update documentation
- Update documentation, configuration

## [1.5.0] - 2025-11-15

### 🆕 Added
- Add Python functionality
- **Complete Claude Proxy Infrastructure**: Full Express.js server with TypeScript configuration and multi-provider support
- **GLM 4.6 Production Ready**: Complete project infrastructure supporting all AI providers (vLLM, Ollama, OpenAI, GLM)
- **API Routes & Handlers**: Anthropic-compatible endpoints with streaming support and error handling
- **Performance Monitoring**: Built-in benchmarking and performance tracking utilities
- **Configuration Templates**: Environment examples for vLLM H100, Ollama, and multi-provider setups
- **Development Tooling**: Complete TypeScript build system with testing and linting scripts

### 🔄 Changed
- **Marketplace Documentation**: Updated main README.md to include Claude Proxy project with GLM 4.6 integration
- **Project Structure**: Enhanced plugin structure section to reflect both plugins and complete projects
- **Navigation**: Added Claude Proxy links to documentation section for better discoverability

## [1.4.0] - 2025-11-15

### 🆕 Added
- Add Python functionality
- **GitHub Spec Kit Compliance Analysis**: Comprehensive SPEC_KIT_COMPLIANCE.md documentation with 100% compliance certification
- **Professional Documentation**: Complete workflow analysis, feature comparison matrix, and compliance validation
- **GLM 4.6 Integration**: Complete GLM 4.6 support via Z.AI with direct Claude Code compatibility
- **Claude Proxy Infrastructure**: Full proxy server with multi-provider support (vLLM, Ollama, OpenAI, GLM)
- **Z.AI Partnership**: Subscription integration with 10% discount offer for GLM Coding Plan

### 🔄 Changed
- **Documentation References**: Updated README.md and SDD README.md to point to comprehensive compliance analysis
- **Link Structure**: Enhanced documentation organization with proper cross-references

## [1.3.2] - 2025-11-12

### ✅ Fixed
- **Version Date Corrections**: Fixed inconsistent version dates across marketplace releases for logical progression
- **Documentation Links**: Added proper anchor link {#sdd-plugin} for cross-reference functionality
- **Timeline Integrity**: Ensured realistic development progression from October 2024 through November 2025

## [1.3.1] - 2025-11-12

### 🆕 Added
- Add Python functionality
- **SmartCommit Version Management**: Automatic version release creation with semantic version bump logic
- **Intelligent Version Bumping**: Patch for fixes, minor for features, major for breaking changes

## [1.3.0] - 2025-11-12

### 🆕 Added
- Add Python functionality
- **Marketplace README Enhancement**: Comprehensive marketplace guide with professional presentation and complete plugin information

### 🔄 Changed
- **Documentation Structure**: Transformed marketplace README with detailed plugin descriptions, usage examples, and professional formatting
- **Plugin Presentation**: Enhanced plugin visibility with key features, quick start guides, and real-world workflow examples

### ✅ Fixed
- **Broken Documentation Link**: Fixed SDD README.md reference to non-existent SPEC_KIT_COMPLIANCE.md file, updated to point to global changelog

## [1.2.0] - 2025-11-10

### 🆕 Added
- Add Python functionality
- **Global CHANGELOG.md**: Unified changelog management for all marketplace plugins
- **SmartCommit Enhancement**: Automatic global CHANGELOG.md creation and management

### 🔄 Changed
- **SmartCommit Workflow**: Enhanced to create and manage global CHANGELOG.md automatically
- **Changelog Structure**: Consolidated SDD plugin changelog into global marketplace changelog
- **Documentation**: Updated all references to point to global changelog location

### ✅ Fixed
- **Plugin Loading**: Resolved marketplace symlink configuration issues
- **Command Execution**: Fixed SmartCommit slash command to properly execute git commits
- **File Management**: Removed duplicate changelog files to maintain single source of truth

## [1.1.0] - 2025-11-08

### 🆕 Added
- Add Python functionality
- **SmartCommit Plugin**: Intelligent commit message generation with automatic changelog updates and commit execution
- **SDD Plugin**: Spec-Driven Development workflow with 9 commands for systematic development

### 🔄 Changed
- **Marketplace Configuration**: Simplified with single "category" field instead of "categories" array
- **SmartCommit Design**: Streamlined to single command approach with automatic commit execution
- **Marketplace Naming**: Restored marketplace name to "marketplace" for simpler installation syntax

## [1.0.0] - 2024-10-01

### 🚀 Released
- **Marketplace Launch**: Initial marketplace setup with SDD and SmartCommit plugins
- **Plugin Architecture**: Complete plugin configuration and documentation structure
- **Command System**: Slash command implementations for both plugins
- **Sample Projects**: Comprehensive samples and examples for SDD workflow
- **Development Environment**: Ready-to-use development environment with proper tooling

---

## 🔍 Plugin History

### SDD Plugin {#sdd-plugin}

#### [1.0.1] - 2025-11-09

##### 🆕 Features Added
- **GitHub Spec Kit Compliance**
  - 📋 Created comprehensive SPEC_KIT_COMPLIANCE.md analysis
  - ✅ Documented 100% workflow alignment with Spec Kit principles
  - 🔍 Detailed comparison with traditional `.specify/memory/` approach

- **Enhanced Memory Approach**
  - 🧠 Comprehensive explanation of distributed memory system
  - 📚 Three-tier memory architecture (Project, Feature, Quality)
  - 📊 Comparison table showing advantages over traditional approaches
  - 👥 Benefits analysis for team collaboration and scalability

- **Documentation Enhancement**
  - 📖 Enhanced SDD README.md with compliance indicators
  - 🎯 Updated core philosophy and features list
  - 🔗 Improved documentation structure and links

##### 🔄 Improvements
- **Professional Documentation**
  - 📝 Better organization of compliance information
  - 💎 Clear explanation of memory management benefits
  - 🎨 Enhanced feature descriptions with compliance focus
  - 😊 Professional formatting with emojis and tables

- **Technical Communication**
  - 🚀 Clear differentiation from traditional approaches
  - 💡 Comprehensive value proposition explanation
  - 🔒 Enhanced user confidence through transparency
  - 🎓 Better onboarding experience for new users

##### 🏗️ Architecture Details
- **Memory System**
  - 🏛️ **Project Memory**: `CONSTITUTION.md`, `docs/constitution.md`, `.claude/constitution.md`
  - 📋 **Feature Memory**: `specs/XXX-feature-name/` with detailed specification files
  - ✅ **Quality Memory**: `checklists/` directory with comprehensive quality gates
  - 📁 All memory files are Git-friendly and human-readable

- **Compliance Matrix**
  - ✅ **Workflow Sequence**: 100% compliant with GitHub Spec Kit
  - 🎯 **Executable Specifications**: Enhanced compliance
  - 🔒 **Quality Gates**: Enhanced with additional validation
  - 📁 **File Structure**: Improved organization over Spec Kit standard
  - 💬 **Command Naming**: `/sdd.*` (enhanced usability vs `/speckit.*`)

#### [1.0.0] - 2025-11-05

##### 🚀 Initial Release
- **SDD Plugin Foundation**
  - ⚡ 9 workflow commands for systematic development
  - 🔄 Constitution → Specify → Plan → Tasks → Checklists → Analyze → Implement workflow
  - 🎯 KISS & YAGNI principles integration
  - 🛠️ Environment management with .env.example and Makefile generation

- **Sample Projects**
  - 🟢 4 complexity levels: Beginner → Intermediate → Advanced → Reference
  - 📈 Progressive learning path with real-world examples
  - ⚡ Complete automation with 137 Makefile commands

- **Core Features**
  - 📋 25-task dependency-organized implementation breakdown
  - ✅ Quality assurance checklists and consistency analysis
  - 🌿 Git integration with automatic branch management
  - 🔗 Traceability from requirements to implementation

- **Documentation Suite**
  - 📖 Complete SDD methodology documentation (SDD.md)
  - 🤖 Claude-specific developer guide (CLAUDE.md)
  - 📚 Comprehensive README.md with usage examples
  - 🎯 Sample outputs for different complexity levels