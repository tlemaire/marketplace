#!/bin/bash
# Spec-Driven Development: Check Spec-Kit Updates Script
# Usage: ./check-spec-kit-updates.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
SPECKIT_REPO="github/spec-kit"
CURRENT_VERSION_FILE=".specify/current_speckit_version"
GITHUB_API_URL="https://api.github.com/repos/$SPECKIT_REPO/releases/latest"

echo -e "${BLUE}🔍 Checking GitHub Spec Kit updates...${NC}"

# Get current version
if [[ -f "$CURRENT_VERSION_FILE" ]]; then
    CURRENT_VERSION=$(cat "$CURRENT_VERSION_FILE")
else
    CURRENT_VERSION="v0.0.0"
    echo "$CURRENT_VERSION" > "$CURRENT_VERSION_FILE"
fi

echo -e "${BLUE}Current version: ${YELLOW}$CURRENT_VERSION${NC}"

# Get latest release from GitHub API
echo -e "${BLUE}Fetching latest release...${NC}"
LATEST_RELEASE=$(curl -s "$GITHUB_API_URL")
LATEST_VERSION=$(echo "$LATEST_RELEASE" | grep -o '"tag_name": "[^"]*"' | cut -d'"' -f4)
RELEASE_NOTES=$(echo "$LATEST_RELEASE" | grep -o '"body": "[^"]*"' | cut -d'"' -f4 | sed 's/\\n/\n/g')

if [[ -z "$LATEST_VERSION" ]]; then
    echo -e "${RED}❌ Failed to fetch latest version${NC}"
    exit 1
fi

echo -e "${BLUE}Latest version: ${GREEN}$LATEST_VERSION${NC}"

# Compare versions
if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
    echo -e "${GREEN}✅ Skill is up to date!${NC}"
    exit 0
else
    echo -e "${YELLOW}🔄 Update available: $CURRENT_VERSION → $LATEST_VERSION${NC}"

    # Show release notes
    echo ""
    echo -e "${BLUE}📝 Release Notes:${NC}"
    echo -e "${YELLOW}$RELEASE_NOTES${NC}"

    # Ask for update
    echo ""
    read -p "Do you want to update the skill? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}🚀 Starting update process...${NC}"

        # Update version file
        echo "$LATEST_VERSION" > "$CURRENT_VERSION_FILE"

        # Download and extract new templates
        TEMP_DIR=$(mktemp -d)
        RELEASE_ZIP="$TEMP_DIR/speckit-release.zip"

        echo -e "${BLUE}📦 Downloading Spec Kit $LATEST_VERSION...${NC}"
        curl -L "https://github.com/$SPECKIT_REPO/archive/$LATEST_VERSION.zip" -o "$RELEASE_ZIP"

        cd "$TEMP_DIR"
        unzip -q "$RELEASE_ZIP"
        SPECKIT_DIR="${SPECKIT_REPO}-${LATEST_VERSION#v}"

        echo -e "${BLUE}🔄 Syncing skill templates...${NC}"

        # Backup current templates
        BACKUP_DIR="../$(pwd)/.specify/backup/$(date +%Y%m%d_%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        cp -r ../templates/ "$BACKUP_DIR/" 2>/dev/null || true

        # Update skill with new Spec Kit templates
        rsync -av --include="*/" --include="*.md" --include="*.sh" --include="*.ps1" --exclude="*" \
            "$SPECKIT_DIR/templates/" "../templates/" || true
        rsync -av --include="*/" --include="*.md" --include="*.sh" --include="*.ps1" --exclude="*" \
            "$SPECKIT_DIR/scripts/" "../scripts/" || true

        # Check for new agents
        NEW_AGENTS=$(cd "$SPECKIT_DIR" && find . -name "*.md" -path "*/agents/*" | sed 's|.*/||' | sed 's|\.md$||')

        if [[ -n "$NEW_AGENTS" ]]; then
            echo -e "${YELLOW}🤖 New agents detected: $NEW_AGENTS${NC}"
            echo -e "${BLUE}Consider updating SDD skill to support these agents${NC}"
        fi

        # Check for new commands
        NEW_COMMANDS=$(cd "$SPECKIT_DIR" && find . -name "*.md" -path "*/commands/*" | sed 's|.*/||' | sed 's|\.md$||')

        if [[ -n "$NEW_COMMANDS" ]]; then
            echo -e "${YELLOW}⚡ New commands detected: $NEW_COMMANDS${NC}"
            echo -e "${BLUE}Consider adding these to SDD skill${NC}"
        fi

        # Cleanup
        cd - > /dev/null
        rm -rf "$TEMP_DIR"

        echo -e "${GREEN}✅ Skill updated successfully to $LATEST_VERSION${NC}"
        echo -e "${BLUE}📁 Backup saved in: $BACKUP_DIR${NC}"

        # Update documentation
        echo -e "${BLUE}📝 Updating skill documentation...${NC}"
        ../scripts/bash/update-skill-docs.sh

    else
        echo -e "${YELLOW}❌ Update cancelled${NC}"
    fi
fi

echo -e "${BLUE}💡 To check manually: https://github.com/$SPECKIT_REPO/releases${NC}"