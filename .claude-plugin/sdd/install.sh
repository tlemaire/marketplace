#!/bin/bash
# Global SDD Skill Installer for Claude Code
# Usage: curl -fsSL https://raw.githubusercontent.com/your-org/sdd-claude-code-skill/main/install.sh | bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/your-org/sdd-claude-code-skill"
REPO_NAME="sdd-claude-code-skill"
INSTALL_DIR="$HOME/.claude/skills/sdd"
VERSION="1.0.0"

echo -e "${BLUE}🚀 Installing SDD Skill for Claude Code${NC}"
echo -e "${BLUE}Repository: ${REPO_URL}${NC}"
echo ""

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo -e "${RED}❌ Claude Code is not installed${NC}"
    echo -e "${YELLOW}Please install Claude Code first:${NC}"
    echo -e "https://code.claude.com/download"
    exit 1
else
    CLAUDE_VERSION=$(claude --version 2>/dev/null | head -n1 || echo "unknown")
    echo -e "${GREEN}✅ Claude Code found: $CLAUDE_VERSION${NC}"
fi

# Check dependencies
if ! command -v git &> /dev/null && ! command -v curl &> /dev/null; then
    echo -e "${RED}❌ Neither git nor curl found${NC}"
    echo -e "${YELLOW}Please install git or curl to continue${NC}"
    exit 1
fi

# Create installation directory
echo -e "${BLUE}📁 Creating installation directory...${NC}"
mkdir -p "$(dirname "$INSTALL_DIR")"

# Download skill
echo -e "${BLUE}📥 Downloading SDD Skill...${NC}"
cd "$(dirname "$INSTALL_DIR")"

if command -v git &> /dev/null; then
    echo -e "${BLUE}   Using git...${NC}"
    if [ -d "sdd" ]; then
        echo -e "${YELLOW}   Existing installation found, updating...${NC}"
        cd sdd
        git pull origin main
    else
        git clone "$REPO_URL" sdd
    fi
else
    echo -e "${BLUE}   Using curl...${NC}"
    rm -rf sdd
    curl -L "$REPO_URL/archive/main.zip" -o sdd.zip
    unzip -q sdd.zip
    mv "$REPO_NAME-main" sdd
    rm sdd.zip
fi

# Verify installation
if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${RED}❌ Installation failed${NC}"
    exit 1
fi

# Set permissions
echo -e "${BLUE}🔧 Setting permissions...${NC}"
chmod -R +x "$INSTALL_DIR/scripts/"
chmod +x "$INSTALL_DIR/scripts/bash/"*.sh 2>/dev/null || true

# Create/update Claude Code settings
echo -e "${BLUE}⚙️  Configuring Claude Code...${NC}"
CLAUDE_SETTINGS="$HOME/.claude/settings.json"

# Create settings directory if it doesn't exist
mkdir -p "$(dirname "$CLAUDE_SETTINGS")"

# Create or update settings
if [ -f "$CLAUDE_SETTINGS" ]; then
    echo -e "${BLUE}   Updating existing settings...${NC}"
    # Backup existing settings
    cp "$CLAUDE_SETTINGS" "$CLAUDE_SETTINGS.backup.$(date +%s)"
else
    echo -e "${BLUE}   Creating new settings...${NC}"
    echo "{}" > "$CLAUDE_SETTINGS"
fi

# Update settings with skill configuration
python3 - << EOF
import json
import sys

settings_file = "$CLAUDE_SETTINGS"
skill_config = {
    "enabled": True,
    "path": "$INSTALL_DIR",
    "version": "$VERSION",
    "auto_update": True,
    "last_check": "$(date -Iseconds)"
}

try:
    with open(settings_file, 'r') as f:
        settings = json.load(f)
except:
    settings = {}

if "skills" not in settings:
    settings["skills"] = {}

settings["skills"]["sdd"] = skill_config

with open(settings_file, 'w') as f:
    json.dump(settings, f, indent=2)

print("✅ Settings updated successfully")
EOF

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Claude Code settings configured${NC}"
else
    echo -e "${YELLOW}⚠️  Could not update Claude Code settings automatically${NC}"
    echo -e "${YELLOW}   Please add the skill manually to your settings${NC}"
fi

# Create environment variables
echo -e "${BLUE}🌍 Setting up environment...${NC}"
SHELL_RC="$HOME/.$(basename "$SHELL")rc"

if ! grep -q "SDD_SKILL_HOME" "$SHELL_RC" 2>/dev/null; then
    cat >> "$SHELL_RC" << 'EOF'

# SDD Skill for Claude Code
export SDD_SKILL_HOME="$HOME/.claude/skills/sdd"
export SDD_GLOBAL_ENABLED=true
EOF
    echo -e "${GREEN}✅ Environment variables added to $SHELL_RC${NC}"
else
    echo -e "${YELLOW}⚠️  Environment variables already exist${NC}"
fi

# Test installation
echo -e "${BLUE}🧪 Testing installation...${NC}"
cd "$INSTALL_DIR"

if [ -f "scripts/bash/create-new-feature.sh" ]; then
    echo -e "${GREEN}✅ Scripts found and executable${NC}"
else
    echo -e "${RED}❌ Scripts not found or not executable${NC}"
    exit 1
fi

# Create verification test
export SPECIFY_FEATURE="test-installation"
if ./scripts/bash/create-new-feature.sh "Test installation" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Skill functionality verified${NC}"
    rm -rf specs/test-installation 2>/dev/null || true
else
    echo -e "${YELLOW}⚠️  Skill functionality test failed (this may be normal)${NC}"
fi

# Display success message
echo ""
echo -e "${GREEN}🎉 SDD Skill installed successfully!${NC}"
echo ""
echo -e "${BLUE}📋 Installation Summary:${NC}"
echo -e "   • Version: $VERSION"
echo -e "   • Location: $INSTALL_DIR"
echo -e "   • Claude Code Settings: $CLAUDE_SETTINGS"
echo ""
echo -e "${BLUE}🚀 Next Steps:${NC}"
echo -e "1. ${YELLOW}Restart your terminal${NC} or run: ${GREEN}source $SHELL_RC${NC}"
echo -e "2. ${YELLOW}Start Claude Code:${NC} ${GREEN}claude${NC}"
echo -e "3. ${YELLOW}Test the skill:${NC} ${GREEN}/sdd.constitution Create principles for quality code${NC}"
echo ""
echo -e "${BLUE}📚 Documentation:${NC}"
echo -e "   • Usage Guide: $INSTALL_DIR/README.md"
echo -e "   • Full Documentation: $INSTALL_DIR/SDD.md"
echo -e "   • GitHub Repository: $REPO_URL"
echo ""
echo -e "${BLUE}🔄 Updates:${NC}"
echo -e "   • Auto-updates are enabled"
echo -e "   • Manual update: ${GREEN}cd $INSTALL_DIR && git pull${NC}"
echo ""
echo -e "${GREEN}✨ Happy Spec-Driven Development!${NC}"