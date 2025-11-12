# Changelog

All notable changes to the marketplace plugins will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- SmartCommit plugin for intelligent commit message generation with automatic changelog updates
- SDD plugin for Spec-Driven Development workflow implementation
- Global CHANGELOG.md for unified marketplace changelog management

### Changed
- Marketplace configuration simplified with single "category" field instead of "categories"
- SmartCommit streamlined to single command approach with automatic commit execution
- Updated marketplace name from "thierry-lemaire-marketplace" to "marketplace"
- Consolidated SDD plugin changelog into global marketplace changelog
- Enhanced SmartCommit to create and manage global CHANGELOG.md automatically

### Fixed
- Plugin loading issues by fixing marketplace symlink configuration
- SmartCommit slash command execution to properly commit after message generation
- Removed duplicate changelog files to maintain single source of truth

## [1.0.0] - 2024-11-12

### Added
- Initial marketplace setup with SDD and SmartCommit plugins
- Plugin configuration and documentation structure
- Slash command implementations for both plugins
- Comprehensive samples and examples for SDD workflow

## SDD Plugin History

### [1.1.0] - 2025-11-12

### Added
- **GitHub Spec Kit Compliance Documentation**
  - Created comprehensive SPEC_KIT_COMPLIANCE.md analysis
  - Documented 100% workflow alignment with Spec Kit principles
  - Detailed comparison with traditional `.specify/memory/` approach

- **Enhanced Memory Approach Documentation**
  - Comprehensive explanation of distributed memory system in README.md
  - Three-tier memory architecture (Project, Feature, Quality)
  - Comparison table showing advantages over traditional approaches
  - Benefits analysis for team collaboration and scalability

- **Enhanced SDD README.md**
  - GitHub Spec Kit compliance section with ✅ status indicator
  - Detailed Enhanced Memory Approach explanation
  - Updated core philosophy and features list
  - Improved documentation structure and links

- **Project Changelog**
  - Created comprehensive CHANGELOG.md for transparent project evolution
  - Follows Keep a Changelog standard with semantic versioning
  - Includes detailed technical documentation

### Improved
- **Documentation Structure**
  - Better organization of compliance information
  - Clear explanation of memory management benefits
  - Enhanced feature descriptions with compliance focus
  - Professional formatting with emojis and tables

- **Technical Communication**
  - Clear differentiation from traditional approaches
  - Comprehensive value proposition explanation
  - Enhanced user confidence through transparency
  - Better onboarding experience for new users

### Technical Details
- **Memory System Architecture**
  - Project Memory: `CONSTITUTION.md`, `docs/constitution.md`, `.claude/constitution.md`
  - Feature Memory: `specs/XXX-feature-name/` with detailed specification files
  - Quality Memory: `checklists/` directory with comprehensive quality gates
  - All memory files are Git-friendly and human-readable

- **Compliance Matrix**
  - Workflow Sequence: 100% compliant with GitHub Spec Kit
  - Executable Specifications: Enhanced compliance
  - Quality Gates: Enhanced with additional validation
  - File Structure: Improved organization over Spec Kit standard
  - Command Naming: `/sdd.*` (enhanced usability vs `/speckit.*`)

### [1.0.0] - 2024-XX-XX

### Added
- **SDD (Spec-Driven Development) Plugin**
  - 9 workflow commands for systematic development
  - Constitution, Specify, Plan, Tasks, Checklists, Analyze, Implement workflow
  - KISS & YAGNI principles integration
  - Environment management with .env.example and Makefile generation

- **Sample Projects**
  - 4 complexity levels: Beginner → Intermediate → Advanced → Reference
  - Progressive learning path with real-world examples
  - Complete automation with 137 Makefile commands

- **Core Features**
  - 25-task dependency-organized implementation breakdown
  - Quality assurance checklists and consistency analysis
  - Git integration with automatic branch management
  - Traceability from requirements to implementation

- **Documentation**
  - Complete SDD methodology documentation (SDD.md)
  - Claude-specific developer guide (CLAUDE.md)
  - Comprehensive README.md with usage examples
  - Sample outputs for different complexity levels