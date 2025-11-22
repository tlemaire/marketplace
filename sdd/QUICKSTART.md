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