---
description: Update SDD with latest GitHub Spec Kit changes while preserving all SDD enterprise enhancements
shortcut: sdd.update-github-spec-kit
---

# SDD Update GitHub Spec Kit Command

Automatically integrate the latest GitHub Spec Kit changes while preserving all SDD enterprise enhancements and customizations.

## What to do:

1. **Version Check First** - Verify if update is needed:
   ```bash
   # Get current SDD analysis date from compliance.md
   ANALYSIS_DATE=$(grep "Analysis Date:" specs/001-sdd-plugin/compliance.md | sed 's/\*\*Analysis Date:\*\* //')
   SDD_VERSION=$(grep "Version:" specs/001-sdd-plugin/compliance.md | sed 's/\*\*Version:\*\* //' | sed 's/ .*//')

   # Fetch latest spec-kit release info from GitHub API
   LATEST_RELEASE=$(curl -s "https://api.github.com/repos/github/spec-kit/releases/latest")
   LATEST_TAG=$(echo "$LATEST_RELEASE" | grep -o '"tag_name": "[^"]*' | sed 's/"tag_name": "//' | sed 's/"//' | head -1)
   LATEST_VERSION=$(echo "$LATEST_TAG" | sed 's/^v//')
   RELEASE_DATE=$(echo "$LATEST_RELEASE" | grep -o '"published_at": "[^"]*' | sed 's/"published_at": "//' | sed 's/"//' | head -1 | cut -d'T' -f1)

   # Compare analysis date with release date
   if [ "$ANALYSIS_DATE" = "$RELEASE_DATE" ]; then
     echo "✅ SDD is already up to date with GitHub Spec Kit v$LATEST_TAG"
     echo "Analysis date matches latest release date: $RELEASE_DATE"
     echo "No update needed at this time."
     exit 0
   elif [[ "$ANALYSIS_DATE" > "$RELEASE_DATE" ]]; then
     echo "✅ SDD appears to be ahead of latest release"
     echo "Analysis date: $ANALYSIS_DATE (newer than release $RELEASE_DATE)"
     echo "No update needed at this time."
     exit 0
   fi

   echo "🔄 Update available: Spec-kit release $LATEST_TAG (dated $RELEASE_DATE) is newer than last analysis ($ANALYSIS_DATE)"
   echo "Release notes: https://github.com/github/spec-kit/releases/tag/$LATEST_TAG"
   ```

2. **Check current SDD version** and GitHub Spec Kit compatibility:
   - Read current compliance status from `specs/001-sdd-plugin/compliance.md`
   - Identify current spec-kit version being tracked
   - Verify SDD structure integrity before updates

3. **Fetch latest GitHub Spec Kit**:
   ```bash
   # Clone latest spec-kit to temporary directory
   git clone https://github.com/github/spec-kit /tmp/spec-kit-latest
   cd /tmp/spec-kit-latest
   git fetch --tags
   # Find latest stable tag or use main branch
   LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "main")
   git checkout $LATEST_TAG
   ```

4. **Analyze changes between current and latest spec-kit**:
   - Compare template structures and command definitions
   - Identify new handoff patterns or workflow changes
   - Check for new agent support features
   - Document any breaking changes or deprecations

5. **Create backup of current SDD customizations**:
   ```bash
   # Create backup directory
   BACKUP_DIR="/tmp/sdd-backup-$(date +%Y%m%d-%H%M%S)"
   mkdir -p "$BACKUP_DIR"

   # Backup critical files
   cp -r commands/core/ "$BACKUP_DIR/"
   cp README.md "$BACKUP_DIR/"
   cp SPEC_KIT_INTEGRATION.md "$BACKUP_DIR/"
   cp specs/001-sdd-plugin/compliance.md "$BACKUP_DIR/"
   ```

6. **Preserve SDD enterprise enhancements inventory**:
   - **Quality Commands**: `code-validate`, `docs-sync`, `setup-hooks`
   - **TDD Suite**: `tdd.*` commands
   - **MCP Integration**: `mcp.*` commands
   - **Enhanced Templates**: Custom SDD template features
   - **Sample Projects**: All complexity-level samples
   - **Advanced Checklists**: 5 comprehensive checklist types

7. **Selective integration of spec-kit updates**:

   ### **Safe Updates (Always Apply)**
   - **YAML frontmatter improvements** that don't conflict
   - **New handoff patterns** if compatible with existing
   - **Documentation improvements** that complement SDD docs
   - **Agent compatibility updates** for new AI agents

   ### **Review Before Applying**
   - **Core workflow changes** that might conflict with SDD enhancements
   - **Template structure changes** that affect SDD templates
   - **New command patterns** that might duplicate SDD features
   - **Breaking changes** that affect existing SDD functionality

7. **Update core commands with safe changes**:

   #### Update `/sdd/specify.md`:
   ```yaml
   # Preserve existing handoffs and add new ones from spec-kit
   # Keep SDD-specific validation and enhancements
   # Integrate new spec-kit features without breaking existing functionality
   ```

   #### Update `/sdd/plan.md`, `/sdd/tasks.md`, `/sdd/implement.md`:
   ```yaml
   # Apply spec-kit improvements while preserving SDD handoffs
   # Maintain SDD workflow enhancements
   # Keep SDD-specific features and validation
   ```

8. **Enhance documentation**:
   - Update `SPEC_KIT_INTEGRATION.md` with new spec-kit features
   - Update compliance analysis with new integration details
   - Add new spec-kit agents to compatibility matrix
   - Document any new workflow patterns adopted

9. **Validate integration**:
   ```bash
   # Test core spec-kit workflow still works
   /sdd.specify "Test integration after update"
   /sdd.plan "Test tech stack validation"
   /sdd.tasks
   /sdd.implement

   # Test SDD enterprise enhancements still work
   /sdd.code-validate --status
   /sdd.setup-hooks --status
   /sdd.checklist "integration,quality,compliance"
   ```

10. **Update integration documentation**:
    - Update version numbers and dates
    - Document new spec-kit features integrated
    - Update compatibility matrix
    - Record any manual adjustments needed

11. **Generate update report**:
    ```markdown
    # GitHub Spec Kit Update Report

    **Date:** [CURRENT_DATE]
    **From Version:** [PREVIOUS_VERSION]
    **To Version:** [NEW_SPEC_KIT_VERSION]
    **SDD Version:** [MAINTAINED]

    ## Changes Applied
    - [List of spec-kit updates integrated]

    ## SDD Enhancements Preserved
    - ✅ All quality assurance commands
    - ✅ TDD integration suite
    - ✅ MCP integration
    - ✅ Advanced task generation
    - ✅ Enterprise quality checklists
    - ✅ Sample projects by complexity

    ## Manual Adjustments
    - [Any conflicts resolved manually]

    ## Validation Results
    - ✅ Core spec-kit workflow functional
    - ✅ SDD enhancements operational
    - ✅ Multi-agent compatibility maintained
    ```

12. **Cleanup temporary files**:
    ```bash
    rm -rf /tmp/spec-kit-latest
    # Optionally keep backup for review
    echo "Backup available at: $BACKUP_DIR"
    ```

## Update Strategy:

### **Preservation Rules**
1. **Never remove SDD exclusive features** without explicit user confirmation
2. **Always backup before making changes** to critical files
3. **Test workflows after each major update** to ensure functionality
4. **Document all changes** for future reference and rollback capability

### **Integration Priority**
1. **High Priority** - YAML handoff improvements, agent compatibility
2. **Medium Priority** - Documentation updates, workflow enhancements
3. **Low Priority** - Cosmetic changes, optional features

### **Conflict Resolution**
- **SDD vs Spec-kit**: Prefer SDD enhancements, adapt spec-kit changes
- **Breaking Changes**: Require user confirmation before applying
- **New Features**: Add as enhancements if they don't conflict

## Validation Checklist:

- [ ] Current SDD functionality tested and working
- [ ] Latest spec-kit cloned and analyzed
- [ ] Backup created successfully
- [ ] SDD enhancements inventory documented
- [ ] Safe updates applied selectively
- [ ] Core spec-kit workflow validated
- [ ] SDD enterprise features validated
- [ ] Documentation updated
- [ ] Update report generated
- [ ] Temporary files cleaned up

## Output:

- **Summary of changes** from spec-kit update
- **Status of SDD enhancements** (all preserved)
- **Validation results** for workflows
- **Update report** location
- **Backup location** for rollback reference
- **Next steps** if any manual intervention needed

## Error Handling:

- **Network issues**: Provide offline update option using cached spec-kit
- **Merge conflicts**: Present conflicts to user for resolution
- **Validation failures**: Rollback changes and report issues
- **Missing enhancements**: Restore from backup and investigate

## Safety Features:

- **Automatic rollback** on validation failure
- **Incremental updates** with validation at each step
- **User confirmation** for potentially breaking changes
- **Comprehensive logging** for troubleshooting
- **Backup creation** before any modifications

This command ensures SDD stays current with GitHub Spec Kit evolution while protecting all valuable enterprise enhancements and maintaining full functionality.