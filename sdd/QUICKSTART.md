# 🚀 SDD Quick Start Guide

> **Get started in 5 minutes with the simplified SDD workflow**

## 🎯 Choose Your Path

### 👶 **I'm New to SDD**
```bash
# Start with the simplest workflow
/sdd.help                    # Get help
/sdd.specify "your idea"      # Create specification
/sdd.implement               # Build it
```

### 🔧 **I Want TDD Testing**
```bash
# Add testing to your workflow
/sdd.specify "your idea"      # Create specification
/sdd.tdd.specify "unit"       # Add unit tests
/sdd.implement               # Build with tests
```

### 🏢 **I Need Professional Quality**
```bash
# Complete workflow with automated quality
/sdd.setup-hooks --hooks pre-commit --validate-level normal
/sdd.constitution "quality standards"
/sdd.specify "detailed requirements"
/sdd.tdd.specify "unit,integration,e2e"
/sdd.plan "tech stack"
/sdd.tasks
/sdd.implement
# Automatic validation happens on each commit
```

### 🔒 **I Need Enterprise-Grade Quality**
```bash
# Complete quality-first workflow
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict
/sdd.constitution "security, performance, documentation"
/sdd.specify "comprehensive requirements"
/sdd.tdd.specify "unit,integration,e2e"
/sdd.plan "React, TypeScript, Node.js"
/sdd.implement
# Continuous validation and documentation sync
```

---

## 📋 One-Command Examples

**Simple Website**:
```bash
/sdd.specify "Create a portfolio website with my projects, contact form, and about section. Use HTML, CSS, and basic JavaScript for smooth scrolling."
```

**Mobile App**:
```bash
/sdd.specify "Build a todo app where users can add tasks, mark complete, and organize by categories. Include push notifications and data sync."
```

**Business Tool**:
```bash
/sdd.specify "Create an inventory management system for tracking products, stock levels, and orders. Include user authentication and reporting dashboard."
```

---

## 🆘 Need Help?

**Stuck? Just ask**: `/sdd.help`

**Confused about commands?**: `/sdd.help "command name"`

**Want examples?**: Check `/sdd/samples/` directory

### 📚 **Sample Projects with Enterprise Quality**

**Real-world examples** showing progressive complexity:

```bash
# Beginner Level (70% Quality Target)
samples/01-beginner/hello-world/
# → Basic quality validation, MCP documentation access
/sdd.setup-hooks --hooks pre-commit --validate-level normal
/mcp.cache add "HTML5 CSS3 JavaScript"

# Intermediate Level (80% Quality Target)
samples/02-intermediate/portfolio/
# → Professional quality gates, SEO validation, advanced MCP
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level normal
/mcp.cache add "React TypeScript Jekyll SEO"
mcp.browser test --url http://localhost:4000

# Advanced Level (85% Quality Target)
samples/03-advanced/kanban-board/
# → Real-time collaboration, load testing, enterprise MCP
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict
mcp.cache add "Socket.IO PostgreSQL Redis"
mcp.browser test --real-time --load-users 1000

# Reference Level (95% Quality Target)
samples/04-reference/authentication/
# → Enterprise compliance, advanced security, professional MCP
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict
mcp.cache add "OAuth2 SAML SOC2 GDPR HIPAA"
mcp.diags --file src/auth/ --security --compliance

# Complete Level (95% Quality Target)
samples/05-complete-example/
# → Mission-critical, complete MCP ecosystem, real-time features
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict
mcp.cache update --scope all
mcp.browser test --collaborative --real-time --load
```

**Each sample includes:**
- ✅ Enterprise quality automation setup
- 🔌 Complete MCP integration workflows
- 📋 Quality validation and reporting
- 🧪 Comprehensive testing strategies
- 📚 Progressive documentation

---

## 🔒 Automatic Quality Validation (NEW)

Once you've set up quality hooks, every commit is automatically validated:

```bash
# After setup, just work normally:
git add .
git commit -m "feat: add user authentication"

# ✅ Automatic validation runs:
#   • Code quality checks and auto-fix
#   • Documentation synchronization
#   • Test validation
#   • Security scanning
#   • Performance checks
```

### Validation Levels
- **Normal**: Auto-fix minor issues, 80% test coverage required
- **Strict**: Zero tolerance, 90% test coverage required
- **Lenient**: Suggestions only, 70% test coverage suggested

---

## 💡 Pro Tips

1. **Start Simple**: Use basic workflow first, add complexity later
2. **🔒 Setup Quality Early**: Configure hooks before starting development
3. **Be Specific**: More detail = better results
4. **Iterate**: You can always refine specifications
5. **Trust Automation**: Let Git hooks handle quality enforcement
6. **Ask Questions**: Claude can clarify your requirements

**Ready? Start with**: `/sdd.setup-hooks --hooks pre-commit` then `/sdd.specify "your project idea"`