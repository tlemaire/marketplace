# Contributing to SDD (Spec-Driven Development) Skill

Thank you for your interest in contributing to the SDD skill! This document provides guidelines and information for contributors.

## 🎯 Project Vision

The SDD skill aims to make Spec-Driven Development accessible and efficient for Claude Code users. We focus on:

- **Simplicity** - Easy to use with minimal configuration
- **Quality** - Built-in best practices and validation
- **Flexibility** - Adaptable to different project types and teams
- **Integration** - Seamless Claude Code and Git integration

## 🤝 How to Contribute

### Reporting Issues

1. **Search existing issues** - Check if the issue has already been reported
2. **Use the issue template** - Provide detailed information about the problem
3. **Include reproduction steps** - Clear steps to reproduce the issue
4. **Add environment details** - Claude Code version, OS, and relevant configurations
5. **Provide logs** - Include any error messages or relevant output

### Suggesting Features

1. **Check the roadmap** - Review planned features in the changelog
2. **Open a feature request** - Use the feature request template
3. **Describe the problem** - Explain what problem the feature solves
4. **Propose a solution** - Suggest how the feature should work
5. **Consider alternatives** - Discuss different approaches

### Code Contributions

#### Prerequisites

- **Node.js 14+** - Development environment
- **Claude Code 2.0.37+** - For testing slash commands
- **Git** - For version control
- **Basic bash scripting** - For utility script modifications

#### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/sdd-claude-code-skill.git
   cd sdd-claude-code-skill
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Install development version**
   ```bash
   npm run install
   ```

4. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

#### Making Changes

1. **Understand the codebase**
   - Read `SDD.md` for the complete workflow
   - Review existing slash commands in `.claude/commands/`
   - Examine bash scripts in `scripts/bash/`

2. **Follow coding standards**
   - Use clear, descriptive variable names
   - Add comments for complex logic
   - Follow existing code style and patterns
   - Keep functions small and focused

3. **Test your changes**
   ```bash
   # Run the test suite
   npm test

   # Test slash commands in Claude Code
   /sdd.help
   /sdd.constitution Test principles
   ```

4. **Update documentation**
   - Update relevant sections in `README.md`
   - Document new commands in `SDD.md`
   - Add examples to command documentation
   - Update `CHANGELOG.md` if applicable

#### Types of Contributions

**Bug Fixes**
- Fix issues with existing functionality
- Improve error handling and messages
- Enhance edge case handling

**New Features**
- Add new slash commands
- Extend existing command functionality
- Integrate with external tools or services

**Documentation**
- Improve existing documentation
- Add tutorials and examples
- Fix typos and clarify unclear sections

**Performance**
- Optimize script performance
- Reduce memory usage
- Improve startup time

#### Submitting Changes

1. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add new command documentation"
   ```

2. **Follow commit message conventions**
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation changes
   - `style:` for formatting changes
   - `refactor:` for code refactoring
   - `test:` for adding or updating tests
   - `chore:` for maintenance tasks

3. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

4. **Create a pull request**
   - Use the pull request template
   - Describe your changes clearly
   - Link any relevant issues
   - Include screenshots if applicable

## 📝 Development Guidelines

### Command Development

When creating new slash commands:

1. **Create command file** in `.claude/commands/`
2. **Follow the template structure**:
   ```markdown
   ---
   description: Brief description of what this command does
   shortcut: short
   category: utility|development|documentation
   difficulty: beginner|intermediate|advanced
   estimated_time: instant|quick|moderate|long
   version: 1.0.0
   ---

   # Command Name

   Detailed instructions for Claude on what this command should do.
   ```

3. **Include comprehensive documentation**:
   - When to use the command
   - Prerequisites and requirements
   - Expected output format
   - Examples and use cases

### Script Development

When modifying bash scripts:

1. **Use proper error handling**
   ```bash
   set -e  # Exit on error
   set -u  # Use undefined variables as error
   ```

2. **Add colored output for readability**
   ```bash
   RED='\033[0;31m'
   GREEN='\033[0;32m'
   YELLOW='\033[1;33m'
   NC='\033[0m' # No Color
   ```

3. **Include usage information**
   ```bash
   if [[ -z "$REQUIRED_PARAM" ]]; then
       echo -e "${RED}Error: Please provide required parameter${NC}"
       echo "Usage: $0 <required_parameter> [optional_parameter]"
       exit 1
   fi
   ```

### Documentation Standards

- **Use clear headings** with proper hierarchy
- **Include code examples** with syntax highlighting
- **Add emoji sparingly** for visual interest
- **Maintain consistent formatting**
- **Link to related resources**

## 🧪 Testing

### Manual Testing

1. **Test all slash commands**
   ```bash
   /sdd.help
   /sdd.constitution Test principles
   /sdd.specify Test feature description
   ```

2. **Test bash scripts**
   ```bash
   ./scripts/bash/create-new-feature.sh "Test feature"
   ./scripts/bash/setup-plan.sh
   ```

3. **Test file generation**
   - Verify spec files are created correctly
   - Check task dependencies
   - Validate checklist completeness

### Automated Testing

Run the test suite:
```bash
npm test
```

The test suite covers:
- Command syntax validation
- File structure verification
- Script functionality
- Integration tests

## 📋 Review Process

### Before Submitting

1. **Code Review Checklist**
   - [ ] Code follows project standards
   - [ ] Tests pass successfully
   - [ ] Documentation is updated
   - [ ] No debug code or console logs
   - [ ] Error handling is appropriate

2. **Functionality Checklist**
   - [ ] Feature works as expected
   - [ ] Edge cases are handled
   - [ ] Performance is acceptable
   - [ ] Integration with existing features works

### After Submission

1. **Maintainer Review**
   - Code quality and standards
   - Feature completeness
   - Documentation accuracy
   - Performance impact

2. **Community Feedback**
   - Usefulness of the feature
   - Potential improvements
   - Additional considerations

3. **Testing**
   - Automated test results
   - Manual verification
   - Integration testing

## 🏷️ Release Process

### Version Management

- **Semantic versioning** (MAJOR.MINOR.PATCH)
- **Changelog updates** for all releases
- **Release notes** with highlights
- **Migration guides** for major versions

### Release Steps

1. **Finalize changelog**
2. **Update version numbers**
3. **Run full test suite**
4. **Create release tag**
5. **Publish to npm (if applicable)**
6. **Update documentation**

## 🤝 Community

### Code of Conduct

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Assume good intentions
- Follow GitHub's Community Guidelines

### Getting Help

- **Issues**: For bug reports and feature requests
- **Discussions**: For questions and general discussion
- **Documentation**: For self-help and learning
- **Examples**: For practical usage patterns

## 📞 Contact

- **Maintainers**: [@maintainer-username]
- **Issues**: [GitHub Issues](https://github.com/your-org/sdd-claude-code-skill/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-org/sdd-claude-code-skill/discussions)

---

Thank you for contributing to the SDD skill! Your contributions help make Spec-Driven Development more accessible to everyone.

*Last Updated: 2024-11-11*