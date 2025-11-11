# Frequently Asked Questions (FAQ)

This document addresses common questions about the SDD (Spec-Driven Development) skill for Claude Code.

## 🚀 Getting Started

### Q: What is SDD (Spec-Driven Development)?

**A:** SDD is a software development methodology that emphasizes creating detailed specifications before writing any code. The SDD skill brings this methodology to Claude Code, providing structured workflows for transforming ideas into specifications and executable code.

### Q: Do I need to install anything special?

**A:** The SDD skill requires:
- **Claude Code 2.0.37+** - For slash command support
- **Node.js 14+** - For npm scripts and installation
- **Git** - For branch management (optional but recommended)

### Q: How do I install the SDD skill?

**A:** Installation depends on your needs:

```bash
# Local installation (current directory only)
npm install

# Global installation (available everywhere)
npm run install

# Development mode
export SDD_SKILL_HOME=$(pwd)
```

### Q: What's the difference between local and global installation?

**A:**
- **Local**: Only works in the current project directory
- **Global**: Available in any directory on your system
- **Development**: Uses the current codebase for testing changes

## 💻 Usage & Workflow

### Q: What's the basic SDD workflow?

**A:** The standard workflow is:

1. **Help**: `/sdd.help` - Get assistance
2. **Constitution**: `/sdd.constitution` - Define project principles
3. **Specification**: `/sdd.specify` - Create detailed feature specification
4. **Clarification**: `/sdd.clarify` - Resolve ambiguities (optional)
5. **Planning**: `/sdd.plan` - Define technical approach
6. **Tasks**: `/sdd.tasks` - Generate implementation tasks
7. **Checklists**: `/sdd.checklist` - Create quality checklists
8. **Analysis**: `/sdd.analyze` - Validate consistency (optional)
9. **Implementation**: `/sdd.implement` - Execute tasks

### Q: Can I use the commands in a different order?

**A:** While some flexibility exists, the recommended order ensures best results:

**Required order**: Constitution → Specification → Planning → Tasks → Implementation
**Optional steps**: Clarification (after specification), Analysis (before implementation), Checklists (before implementation)

### Q: What if I don't know what to put in my constitution?

**A:** Start with basic principles and refine over time:

```bash
/sdd.constitution Focus on code quality, user experience, performance, and maintainability. Prioritize simplicity over complexity and test all critical functionality.
```

### Q: How detailed should my specification be?

**A:** Good specifications include:
- **User stories** with clear acceptance criteria
- **Functional requirements** with specific behaviors
- **Non-functional requirements** (performance, security, accessibility)
- **Success metrics** and validation criteria
- **Out of scope** items to prevent scope creep

## 🔧 Commands

### Q: Why isn't `/sdd.help` working?

**A:** This could be due to several reasons:
1. **Installation issue**: Verify installation with `ls ~/.claude/skills/sdd/`
2. **Claude Code restart**: Some changes require restarting Claude Code
3. **Global vs local**: Ensure you're using the right installation type

Try reinstalling:
```bash
npm run uninstall
npm run install
```

### Q: What does `/sdd.clarify` do?

**A:** The `/sdd.clarify` command:
- Analyzes your specification for unclear requirements
- Identifies areas marked with `[NEEDS CLARIFICATION]`
- Asks interactive questions to resolve ambiguities
- Helps create more complete specifications

### Q: How many tasks does `/sdd.tasks` generate?

**A:** By default, `/sdd.tasks` generates 25 tasks organized by:
- **Dependencies** - Tasks that must be completed first
- **Priority** - Critical path tasks first
- **Complexity** - Balancing simple and complex tasks
- **Logical grouping** - Related tasks together

### Q: What types of checklists can `/sdd.checklist` create?

**A:** `/sdd.checklist` supports several types:
- **Requirements** - Validates functional and non-functional requirements
- **UX** - User experience and usability testing
- **Performance** - Performance benchmarks and testing
- **Accessibility** - WCAG compliance and testing
- **Security** - Security validation and testing
- **Custom** - Project-specific quality gates

## 📁 Files & Structure

### Q: Where are my specifications stored?

**A:** Specifications are stored in the `specs/` directory:

```
specs/
├── 001-feature-name/
│   ├── spec.md              # Main specification
│   ├── plan.md              # Technical plan
│   ├── tasks.md             # Implementation tasks
│   ├── research.md          # Technical research
│   └── checklists/          # Quality checklists
```

### Q: Can I modify the generated files?

**A:** Yes! Generated files are meant to be:
- **Customizable** - Edit to match your specific needs
- **Living documents** - Update as requirements evolve
- **Version controlled** - Track changes with Git
- **Collaborative** - Share with team members for review

### Q: What's the `.specify/` directory for?

**A:** The `.specify/` directory contains:
- **memory/constitution.md** - Project principles and standards
- **Templates** - Customizable specification templates
- **Configuration** - SDD skill settings and preferences

## 🌟 Advanced Features

### Q: Can I customize the templates?

**A:** Yes! Templates are stored in the `templates/` directory:
- **spec-template.md** - Specification template
- **plan-template.md** - Technical plan template
- **task-template.md** - Task generation template

Modify these to match your team's standards and practices.

### Q: How does Git integration work?

**A:** SDD automatically:
- **Creates branches** for each feature (001-feature-name)
- **Switches branches** when starting new features
- **Detects conflicts** and provides guidance
- **Supports merges** when features are complete

### Q: Can I use SDD with existing projects?

**A:** Absolutely! SDD works with:
- **New projects** - Start from scratch with SDD methodology
- **Existing projects** - Apply SDD to new features
- **Legacy code** - Document existing functionality with specifications
- **Teams** - Gradually adopt SDD practices

## 🔍 Troubleshooting

### Q: Installation fails with permission errors

**A:** Try these solutions:

```bash
# Fix npm permissions
npm config set prefix ~/.npm-global
export PATH=~/.npm-global/bin:$PATH

# Or use npx
npx npm install

# Or install globally with sudo (not recommended)
sudo npm install -g
```

### Q: Commands are very slow

**A:** Performance issues can be caused by:
- **Large specification files** - Keep specs focused and modular
- **Complex dependencies** - Review task dependencies
- **Network issues** - Check internet connectivity
- **Resource constraints** - Close unnecessary applications

### Q: Generated tasks don't make sense

**A:** Tasks might be unclear when:
- **Specification is vague** - Add more detail to spec.md
- **Technical plan is missing** - Create a comprehensive plan.md
- **Requirements conflict** - Use `/sdd.analyze` to check consistency
- **Context is unclear** - Provide more background information

### Q: Git branch conflicts

**A:** Handle Git conflicts by:

```bash
# Sync with main branch
git checkout main
git pull
git checkout 001-feature-name
git rebase main

# Resolve conflicts manually
git add .
git rebase --continue

# Or use merge instead of rebase
git merge main
```

## 📊 Integration

### Q: Does SDD work with other tools?

**A:** SDD integrates well with:
- **Project management tools** - Export tasks to Jira, Trello, etc.
- **CI/CD pipelines** - Use specifications as test inputs
- **Documentation platforms** - Sync with Confluence, Notion
- **Code review tools** - Link specifications to pull requests

### Q: Can I use SDD with team collaboration?

**A:** Yes, SDD supports team workflows:
- **Shared specifications** - Use Git to share specs
- **Concurrent development** - Work on different features simultaneously
- **Code reviews** - Review specifications before implementation
- **Quality gates** - Team-specific checklist requirements

## 🔒 Security & Privacy

### Q: Where is my data stored?

**A:** All SDD data is stored locally:
- **Specifications** - In your project's `specs/` directory
- **Configuration** - In `.specify/` directory
- **Cache** - Temporary files in system temp directory
- **No cloud storage** - Data never leaves your machine

### Q: Is SDD safe for proprietary projects?

**A:** Yes, SDD is designed for privacy:
- **Local processing** - All operations happen on your machine
- **No telemetry** - No usage data is collected
- **No internet required** - Works offline
- **Open source** - Code is transparent and auditable

## 🆘 Getting Help

### Q: Where can I get additional help?

**A:** Several resources are available:
- **Built-in help**: `/sdd.help` for immediate assistance
- **Documentation**: `README.md` and `SDD.md` for comprehensive guides
- **Issues**: [GitHub Issues](https://github.com/your-org/sdd-claude-code-skill/issues) for bug reports
- **Discussions**: [GitHub Discussions](https://github.com/your-org/sdd-claude-code-skill/discussions) for questions

### Q: How do I report bugs or request features?

**A:** Use the GitHub issue tracker:
1. **Search existing issues** - Check if already reported
2. **Use templates** - Provide all required information
3. **Include details** - Steps to reproduce, environment info
4. **Be specific** - Clear descriptions of desired behavior

### Q: Can I contribute to the SDD skill?

**A:** Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- **Development setup** - How to get started
- **Coding standards** - Guidelines for contributions
- **Review process** - How changes are approved
- **Community guidelines** - Code of conduct and etiquette

---

## 🎯 Quick Tips

### For Beginners
- Start with simple specifications
- Use `/sdd.help` frequently
- Review generated files before implementation
- Follow the recommended workflow order

### For Teams
- Establish team constitution early
- Create custom templates for consistency
- Use Git branches for feature isolation
- Conduct specification reviews

### For Advanced Users
- Customize templates to match standards
- Integrate with existing development tools
- Automate with bash scripts
- Contribute improvements back to the project

---

*Last Updated: 2024-11-11*

Still have questions? [Open an issue](https://github.com/your-org/sdd-claude-code-skill/issues) or join our [discussions](https://github.com/your-org/sdd-claude-code-skill/discussions).