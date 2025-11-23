# SDD GitHub Spec Kit Update Guide

## 🔄 Update Commands

### Quick Start
```bash
# Safe manual update
/sdd.update-github-spec-kit

# Smart automated update
/sdd.auto-update-spec-kit

# Preview updates
/sdd.auto-update-spec-kit --dry-run
```

## Command Details

### `/sdd.update-github-spec-kit`
**Purpose:** Manual update with full control over the integration process

**Features:**
- **Version Check First**: Automatically checks if newer version is available
- **Smart Version Detection**: Compares current vs latest spec-kit version
- **No Update if Current**: Exits gracefully if already up-to-date
- Downloads latest GitHub Spec Kit (only if needed)
- Analyzes changes vs current version
- Creates backup of SDD customizations
- Preserves all SDD enterprise enhancements
- Requires user confirmation for changes
- Generates detailed update report

**Version Check Logic:**
```bash
# Extract current version from compliance.md
CURRENT_VERSION=$(grep "Analysis Date:" specs/001-sdd-plugin/compliance.md | head -1)

# Fetch latest version from GitHub
LATEST_VERSION=$(curl -s https://api.github.com/repos/github/spec-kit/releases/latest | grep tag_name)

# Compare and proceed only if update needed
if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
  # Proceed with update
else
  echo "✅ Already up to date"
  exit 0
fi
```

**Best for:** Users who want full control and understanding of changes

### `/sdd.auto-update-spec-kit`
**Purpose:** Automated intelligent update with conflict resolution

**Modes:**
```bash
# Safe mode - only non-breaking changes
/sdd.auto-update-spec-kit --mode safe

# Smart mode - intelligent conflict resolution
/sdd.auto-update-spec-kit --mode smart

# Advanced mode - maximum integration
/sdd.auto-update-spec-kit --mode advanced
```

**Features:**
- **Automatic Version Check**: Verifies if newer version exists before proceeding
- **Smart Version Detection**: Uses GitHub API for latest release information
- **No Unnecessary Updates**: Skips process if already current version
- Automatic conflict detection and resolution
- Intelligent merge of compatible features
- Progressive validation and rollback
- Enhancement opportunity detection
- Comprehensive reporting

**Version Check Behavior:**
```bash
# Smart version detection with GitHub API
LATEST_RELEASE=$(curl -s https://api.github.com/repos/github/spec-kit/releases/latest)

# Only proceed if update is available
if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
  echo "🔄 Update available: $CURRENT_VERSION → $LATEST_VERSION"
  # Ask for confirmation (unless --auto-accept)
  # Proceed with intelligent update
else
  echo "✅ Already up to date - no action needed"
  exit 0
fi
```

**Best for:** Users who want automated updates with confidence

## Usage Examples

### Preview Updates
```bash
# See what would change without making modifications
/sdd.auto-update-spec-kit --dry-run --verbose

# Check if update is available (fast check)
/sdd.update-github-spec-kit --check-only
```

### Selective Updates
```bash
# Update only specific components
/sdd.auto-update-spec-kit --update handoffs,documentation

# Exclude certain areas from updates
/sdd.auto-update-spec-kit --exclude samples,templates
```

### Enhanced Integration
```bash
# Automatically enhance existing SDD features
/sdd.auto-update-spec-kit --enhance-existing --preserve-workflow
```

## Version Check Behavior

### Smart Version Detection
Both commands automatically check if an update is needed:

```bash
# Example output when up to date
✅ SDD is already up to date with GitHub Spec Kit v2025-11-15
No update needed at this time.
Last checked: 2025-11-23 10:30:45

# Example output when update available
🔄 Update available: 2025-11-12 → 2025-11-15
Release notes: https://github.com/github/spec-kit/releases/tag/v2025-11-15
Proceed with update? (y/N)
```

### Version Sources
- **Current Version**: Extracted from `specs/001-sdd-plugin/compliance.md` (Analysis Date)
- **Latest Version**: Fetched from GitHub API (latest release tag)
- **Comparison**: Only proceeds if versions differ

### Check-Only Mode
```bash
# Fast version check without update process
/sdd.update-github-spec-kit --check-only

# Output examples:
# 📊 Version Status:
# Current: 2025-11-12
# Latest:  2025-11-15
# Status:   ⬆️ Update available
# or
# Status:   ✅ Up to date
```

## What Gets Preserved

✅ **Always Preserved SDD Enhancements:**
- Quality automation commands (`code-validate`, `docs-sync`, `setup-hooks`)
- TDD integration suite (`tdd.*` commands)
- MCP integration (`mcp.*` commands)
- Advanced task generation (25-task system)
- Enterprise quality checklists (5 comprehensive types)
- Sample projects by complexity level
- Custom SDD templates and workflows

## What Gets Updated

🔄 **Safe Auto-Applied Updates:**
- YAML frontmatter improvements
- New AI agent compatibility
- Documentation enhancements
- Non-breaking workflow improvements

🤔 **Smart Merges (User Confirmed):**
- New spec-kit features that complement SDD
- Template structure improvements
- Advanced workflow patterns

🚫 **Manual Review Required:**
- Breaking changes to core workflows
- Conflicts with existing SDD features
- Major structural changes

## Validation and Safety

### Automatic Validation
Both commands perform comprehensive validation:
- Core spec-kit workflow testing
- SDD enhancement functionality verification
- Multi-agent compatibility checks
- Documentation consistency validation

### Backup and Recovery
```bash
# Commands automatically create backups
# Backup location shown in output

# Manual rollback if needed
/sdd.rollback-auto-update --point latest --confirm
```

### Progress Tracking
- Real-time progress indicators
- Detailed logging at each step
- Error recovery suggestions
- Comprehensive update reports

## When to Update

### Recommended Update Triggers
- **Monthly:** Regular maintenance and security updates
- **New Spec-kit Release:** Major feature additions
- **New Agent Support:** When new AI agents are added to spec-kit
- **Performance Issues:** If workflows seem outdated

### Pre-Update Checklist
- ✅ Current SDD functionality is working correctly
- ✅ No active development in progress
- ✅ Backup important project data
- ✅ Review update report before applying changes

## Troubleshooting

### Common Issues
```bash
# Network connectivity issues
/sdd.update-github-spec-kit --offline-mode

# Merge conflicts
/sdd.auto-update-spec-kit --resolve-conflicts --interactive

# Validation failures
/sdd.rollback-auto-update --restore-backup
```

### Getting Help
```bash
# Get help with update commands
/sdd.help "update-github-spec-kit"
/sdd.help "auto-update-spec-kit"

# Check current version and status
/sdd.update-github-spec-kit --status
```

## Best Practices

1. **Use dry-run first** to preview changes
2. **Create manual backups** of critical customizations
3. **Test updates in development** before production
4. **Review update reports** for any manual steps needed
5. **Keep documentation updated** with new features

---

**Result:** SDD stays current with GitHub Spec Kit evolution while automatically protecting all valuable enterprise enhancements. 🚀