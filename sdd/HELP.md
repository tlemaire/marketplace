# 🆘 SDD Help Center

> **Everything you need to use SDD successfully - find answers fast**

## 🔍 **What Do You Need Help With?**

### **👶 Just Starting?**
- [Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [Commands Cheat Sheet](COMMANDS.md) - All commands in one place
- Basic Workflow: `/sdd.help "beginner"`

### **🔧 Need Specific Commands?**
- All Commands: `/sdd.help "commands"`
- Testing Commands: `/sdd.help "tdd"`
- Quality Commands: `/sdd.help "quality"`
- MCP Commands: `/mcp.help` (Documentation, Browser Testing, Diagnostics, Cache)
- Update Commands: `/sdd.update-github-spec-kit --check-only` (Version check and updates)
- Validation: `/sdd.code-validate` (Code quality & documentation)
- Git Hooks: `/sdd.setup-hooks` (Automated validation)

### **📚 Want Examples?**
- Simple Examples: `/sdd.help "examples"`
- Project Templates: `/sdd.help "templates"`
- Sample Projects: Check `/sdd/samples/` directory

### **🐛 Having Problems?**
- Command Not Working: `/sdd.help "troubleshoot"`
- File Issues: `/sdd.validate`
- confused: `/sdd.clarify`

---

## 🎯 **Quick Solutions**

### **"I don't know which command to use"**
→ Start with: `/sdd.specify "your project idea"`
→ Claude will guide you to the next steps

### **"My project is simple, I want to keep it simple"**
→ Use: `/sdd.specify "your idea"` → `/sdd.implement`

### **"I need high-quality, tested code"**
→ Use: `/sdd.specify "detailed idea"` → `/sdd.tdd.specify "unit,integration"` → `/sdd.implement`

### **"I'm building something important for work"**
→ Use: `/sdd.constitution "security, performance"` → `/sdd.specify "requirements"` → `/sdd.plan "tech stack"` → `/sdd.tasks` → `/sdd.checklist "all"` → `/sdd.implement`

### **"I need enterprise-grade quality and documentation"**
→ Use: `/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict` → `/sdd.constitution "security, performance, documentation"` → `/sdd.specify "requirements"` → `/sdd.implement` → `/sdd.code-validate --scope all --strict` → `/sdd.docs-sync --all --auto`

### **"I want to keep SDD updated with latest GitHub Spec Kit"**
- Use: `/sdd.update-github-spec-kit --check-only` (quick check) → `/sdd.auto-update-spec-kit --mode smart` (automated update)

### **"I need to verify SDD is working correctly"**
- Use: `/sdd.update-github-spec-kit --check-only` → `/sdd.validate` → `/sdd.code-validate --status`

---

## 💬 **Ask Claude Anything**

You can get help by simply asking:

- "What SDD command should I use for a simple website?"
- "How do I add testing to my project?"
- "What's the difference between `/sdd.specify` and `/sdd.plan`?"
- "Can you show me an example of a mobile app specification?"
- "I'm stuck, what should I do next?"

Claude understands natural language and will guide you!

---

## 📖 **Deep Dive Documentation**

If you want to understand everything about SDD:

- [Complete README](README.md) - Full documentation
- [Sample Projects](samples/) - Real examples by complexity
- [Templates](templates/) - Project templates and patterns
- [Specifications](specs/) - Technical specifications

---

## 🚀 **Ready to Start?**

**Best first step**: `/sdd.specify "your project idea"`

**Need examples**: `/sdd.help "examples"`

**Want to learn**: `/sdd.help "tutorial"`

**Just explore**: Check out the [samples/](samples/) directory

---

*Remember: SDD is designed to be helpful at every step. Just ask if you need anything!* 🤖