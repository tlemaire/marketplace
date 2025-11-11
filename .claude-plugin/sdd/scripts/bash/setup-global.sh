#!/bin/bash
# Post-installation setup script for global SDD skill
# This script runs after npm installation

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔧 Setting up SDD skill globally...${NC}"

# Get installation directory
INSTALL_DIR="$(dirname "$(dirname "$(dirname "$(readlink -f "$0")")")")"
echo -e "${BLUE}📁 Installation directory: $INSTALL_DIR${NC}"

# Verify installation
if [ ! -f "$INSTALL_DIR/SDD.md" ]; then
    echo -e "${RED}❌ SDD skill files not found${NC}"
    exit 1
fi

# Set script permissions
echo -e "${BLUE}🔧 Setting script permissions...${NC}"
chmod +x "$INSTALL_DIR/scripts/bash/"*.sh 2>/dev/null || true

# Create global config directory
mkdir -p "$HOME/.specify"

# Create verification test
echo -e "${BLUE}🧪 Creating verification test...${NC}"
cd "$INSTALL_DIR"

if [ -f "scripts/bash/create-new-feature.sh" ]; then
    echo -e "${GREEN}✅ Scripts are properly configured${NC}"
else
    echo -e "${RED}❌ Scripts not found${NC}"
    exit 1
fi

echo -e "${GREEN}✅ SDD skill setup complete!${NC}"
echo -e "${BLUE}🚀 You can now use SDD commands in Claude Code:${NC}"
echo -e "   • /sdd.constitution"
echo -e "   • /sdd.specify"
echo -e "   • /sdd.plan"
echo -e "   • /sdd.tasks"
echo -e "   • /sdd.implement"