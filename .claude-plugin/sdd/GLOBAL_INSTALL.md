# Global SDD Skill Installation for Claude Code

**Deploy the SDD (Spec-Driven Development) skill globally for all Claude Code users**

## 🚀 Installation Methods

### Method 1: Claude Code Plugin (Recommended)
```bash
# Install as Claude Code plugin
claude plugin install sdd-spec-driven-development

# Or install from GitHub repository
claude plugin install https://github.com/your-org/sdd-claude-code-skill
```

### Method 2: Global Directory Installation
```bash
# Create global Claude Code skills directory
mkdir -p ~/.claude/skills

# Clone or copy the SDD skill
git clone https://github.com/your-org/sdd-claude-code-skill.git ~/.claude/skills/sdd

# Or download and extract
curl -L https://github.com/your-org/sdd-claude-code-skill/archive/main.zip -o sdd.zip
unzip sdd.zip -d ~/.claude/skills/
mv ~/.claude/skills/sdd-claude-code-skill-main ~/.claude/skills/sdd
rm sdd.zip
```

### Method 3: npm Package Distribution
```bash
# Install via npm
npm install -g @claude-code/sdd-skill

# The skill will be automatically available in Claude Code
```

## 📋 Automatic Setup Script

Run this one-command installer:
```bash
curl -fsSL https://raw.githubusercontent.com/your-org/sdd-claude-code-skill/main/install.sh | bash
```

## ✅ Verification

After installation, verify the skill is available:
```bash
# Test the skill in Claude Code
claude "Test SDD skill: /sdd.constitution Create principles for quality code"

# Or check if commands are recognized
claude --help | grep sdd
```

## 🛠️ Manual Installation Steps

If auto-installation doesn't work, follow these steps:

### 1. Download the Skill
```bash
# Option A: Git clone
git clone https://github.com/your-org/sdd-claude-code-skill.git /tmp/sdd-skill

# Option B: Download zip
wget https://github.com/your-org/sdd-claude-code-skill/archive/main.zip -O /tmp/sdd.zip
unzip /tmp/sdd.zip -d /tmp/
mv /tmp/sdd-claude-code-skill-main /tmp/sdd-skill
```

### 2. Install to Global Location
```bash
# Create Claude Code skills directory
mkdir -p ~/.claude/skills

# Copy skill files
cp -r /tmp/sdd-skill/* ~/.claude/skills/sdd/

# Set permissions
chmod -R +x ~/.claude/skills/sdd/scripts/
```

### 3. Update Claude Code Configuration
```bash
# Add to Claude Code settings
cat >> ~/.claude/settings.json << 'EOF'
{
  "skills": {
    "sdd": {
      "enabled": true,
      "path": "~/.claude/skills/sdd",
      "version": "1.0.0"
    }
  }
}
EOF
```

## 🔧 Configuration Options

### Environment Variables
```bash
# Add to ~/.bashrc or ~/.zshrc
export SDD_SKILL_HOME="$HOME/.claude/skills/sdd"
export SDD_GLOBAL_ENABLED=true
```

### Claude Code Settings
```json
{
  "skills": {
    "sdd": {
      "enabled": true,
      "auto_update": true,
      "check_interval": "weekly",
      "sync_with_speckit": true
    }
  }
}
```

## 📚 Usage After Installation

Once installed globally, the skill is available in any Claude Code session:

```bash
# From any directory
cd /path/to/your/project
claude

# Inside Claude Code:
/sdd.constitution Create principles for scalable architecture
/sdd.specify Build a microservices-based e-commerce platform
/sdd.plan Use Docker, Kubernetes, React, Node.js, and PostgreSQL
/sdd.tasks
/sdd.implement
```

## 🔄 Updates and Maintenance

### Automatic Updates
```bash
# Enable automatic updates
claude plugin update sdd-spec-driven-development

# Or check for updates manually
~/.claude/skills/sdd/scripts/bash/check-spec-kit-updates.sh
```

### Manual Updates
```bash
# Update to latest version
cd ~/.claude/skills/sdd
git pull origin main

# Or reinstall
curl -fsSL https://raw.githubusercontent.com/your-org/sdd-claude-code-skill/main/install.sh | bash
```

## 🐛 Troubleshooting

### Skill Not Found
```bash
# Check installation
ls -la ~/.claude/skills/sdd/

# Verify permissions
ls -la ~/.claude/skills/sdd/scripts/bash/

# Reinstall if needed
curl -fsSL https://raw.githubusercontent.com/your-org/sdd-claude-code-skill/main/install.sh | bash
```

### Commands Not Working
```bash
# Check Claude Code version
claude --version

# Verify skill is enabled
cat ~/.claude/settings.json | grep sdd

# Test with simple command
claude "List available skills"
```

### Permission Issues
```bash
# Fix script permissions
chmod -R +x ~/.claude/skills/sdd/scripts/
chmod +x ~/.claude/skills/sdd/scripts/bash/*.sh

# Fix file ownership
sudo chown -R $USER:$USER ~/.claude/skills/sdd/
```

## 🗑️ Uninstallation

Remove the global skill:
```bash
# Remove plugin
claude plugin uninstall sdd-spec-driven-development

# Or remove manually
rm -rf ~/.claude/skills/sdd

# Remove from settings
sed -i '/sdd/d' ~/.claude/settings.json
```

## 📞 Support

- **GitHub Issues**: https://github.com/your-org/sdd-claude-code-skill/issues
- **Documentation**: https://github.com/your-org/sdd-claude-code-skill/wiki
- **Community**: https://github.com/your-org/sdd-claude-code-skill/discussions

---

**Transform your development workflow with SDD - now available globally for all Claude Code users!**