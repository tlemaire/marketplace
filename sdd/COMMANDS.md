# 📋 SDD Commands Cheat Sheet

> **Quick reference for all SDD commands - find what you need fast**

## 🚀 **Core Workflow** (Use these 90% of the time)

| Command | What It Does | When to Use |
|---------|--------------|-------------|
| `/sdd.help` | Get help and examples | **Always start here** |
| `/sdd.specify "idea"` | Turn your idea into a plan | **First step for any project** |
| `/sdd.implement` | Build your project | **When you're ready to code** |

---

## 🔧 **Enhanced Workflow** (Add these when needed)

| Command | What It Does | Use Case |
|---------|--------------|----------|
| `/sdd.constitution "rules"` | Set quality standards | Important projects |
| `/sdd.plan "tech stack"` | Choose technologies | Custom development |
| `/sdd.tasks` | Get step-by-step tasks | Complex projects |
| `/sdd.checklist "quality"` | Quality validation | Before deployment |
| `/sdd.code-validate` | Code validation & fixes | Every code change |
| `/sdd.docs-sync` | Documentation sync | Auto-update docs |
| `/sdd.setup-hooks` | Git hooks automation | Enforce standards |

---

## 🧪 **Testing Commands** (Add when you need quality)

| Command | What It Does | Use Case |
|---------|--------------|----------|
| `/sdd.tdd.specify "unit"` | Create test plan | Want reliable code |
| `/sdd.tdd.design` | Setup test tools | Professional projects |
| `/sdd.tdd.implement` | Code with tests | High-quality apps |
| `/sdd.tdd.coverage` | Check test quality | Team projects |

---

## 🔄 **Update Commands** (Keep SDD current with latest GitHub Spec Kit)

| Command | What It Does | Use Case |
|---------|--------------|----------|
| `/sdd.update-github-spec-kit --check-only` | Check if update available | Quick version check |
| `/sdd.update-github-spec-kit` | Manual update with full control | Safe user-controlled updates |
| `/sdd.auto-update-spec-kit --mode smart` | Automated intelligent update | Hands-free updates |
| `/sdd.auto-update-spec-kit --dry-run` | Preview what would update | Test before applying |

---

## 🔌 **MCP Commands** (Enhanced capabilities with local MCP servers)

| Command | What It Does | Use Case |
|---------|--------------|----------|
| `/mcp.resolve React` | Get library documentation IDs | Research libraries |
| `/mcp.docs "/vercel/next.js"` | Fetch up-to-date documentation | Current API references |
| `/mcp.browser test` | Automated browser testing | Web app validation |
| `/mcp.diags --fix` | Code quality diagnostics | Error detection & fixes |
| `/mcp.cache update` | Cache libraries for offline use | Offline documentation access |
| `/mcp.help` | MCP commands help | MCP command reference |

---

## 🛠️ **Advanced Commands** (Power user tools)

| Command | What It Does | Use Case |
|---------|--------------|----------|
| `/sdd.clarify` | Fix unclear requirements | Complex specifications |
| `/sdd.analyze` | Check for problems | Quality assurance |
| `/sdd.validate` | Check project structure | Organization standards |

---

## 🎯 **Popular Combinations**

### **Quick Project** (5 minutes):
```bash
/sdd.specify "your idea"
/sdd.implement
```

### **Quality Project** (15 minutes):
```bash
/sdd.specify "detailed idea"
/sdd.tdd.specify "unit"
/sdd.implement
/sdd.tdd.coverage
```

### **Professional Project** (30 minutes):
```bash
/sdd.constitution "security, performance"
/sdd.specify "comprehensive requirements"
/sdd.tdd.specify "unit,integration,e2e"
/sdd.plan "specific technologies"
/sdd.tasks
/sdd.checklist "all"
/sdd.implement
```

### **Enhanced Project with MCP** (45 minutes):
```bash
/mcp.resolve React
/mcp.docs "/vercel/next.js" --topic authentication
/mcp.cache add React  # Cache for offline use
/sdd.specify "React app with authentication"
/sdd.plan "React, TypeScript, Tailwind"
/sdd.tdd.specify "unit,integration"
/sdd.implement
/mcp.diags --fix
/mcp.browser test --url http://localhost:3000
```

### **Quality-First Project** (60 minutes):
```bash
/sdd.setup-hooks --hooks pre-commit,pre-push --validate-level strict
/sdd.constitution "security, performance, documentation"
/sdd.specify "comprehensive requirements with validation"
/sdd.plan "React, TypeScript, Jest, Cypress"
/sdd.tdd.specify "unit,integration,e2e"
/sdd.implement
# Automatic validation via hooks
/sdd.code-validate --scope all --strict
/sdd.docs-sync --all --auto
```

---

## 💡 **Smart Usage Tips**

1. **🎯 Start Simple**: Use `/sdd.specify` first, add more commands later
2. **❓ Ask for Help**: `/sdd.help` anytime you're stuck
3. **🔄 Iterate**: You can refine specifications and re-run commands
4. **📋 Follow the Order**: Commands work best in sequence (specify → plan → implement)
5. **✅ Quality First**: Setup validation hooks early: `/sdd.setup-hooks --hooks pre-commit`
6. **📚 Keep Docs Current**: Sync documentation automatically: `/sdd.docs-sync --auto`
7. **🔍 Validate Everything**: Run code validation before commits: `/sdd.code-validate --scope staged`

---

## 🆘 **Quick Help**

**Need examples?** Ask: `/sdd.help "examples"`

**Command not working?** Check: `/sdd.validate`

**Want testing?** Try: `/sdd.tdd.specify "help"`

**Need documentation?** Use: `/mcp.resolve React` → `/mcp.docs "/vercel/next.js"`

**Ready to start?** Use: `/sdd.specify "your project idea"` 🚀