---
description: Automated update of GitHub Spec Kit with intelligent conflict resolution and enhancement preservation
shortcut: sdd.auto-update-spec-kit
---

# SDD Auto Update GitHub Spec Kit Command

Intelligent automated update system that seamlessly integrates the latest GitHub Spec Kit changes while automatically preserving SDD enterprise enhancements through advanced conflict resolution.

## Automated Process:

### Phase 1: Analysis & Preparation

1. **Intelligent Version Detection**:
   ```bash
   # Auto-detect current spec-kit version from compliance.md
   CURRENT_VERSION=$(grep "Analysis Date:" specs/001-sdd-plugin/compliance.md | head -1 | sed 's/.*Analysis Date: //' | sed 's/ .*//')

   # Fetch latest available versions
   git ls-remote --tags https://github.com/github/spec-kit | sort -V | tail -5
   ```

2. **Enhanced Fingerprinting System**:
   - Create SHA-256 fingerprints of all SDD custom files
   - Map spec-kit template features to SDD equivalents
   - Generate compatibility matrix for automatic updates

3. **Predictive Conflict Analysis**:
   ```python
   # Analyze potential conflicts before making changes
   conflicts = analyze_file_changes(current_files, latest_spec_kit)
   safe_updates, risky_updates, conflicts = categorize_changes(conflicts)
   ```

### Phase 2: Smart Integration

4. **Selective Application Engine**:
   - **Safe Updates**: Automatically apply YAML improvements, agent compatibility
   - **Risky Updates**: Require user approval for workflow changes
   - **Conflicts**: Use intelligent merge strategies for SDD vs spec-kit differences

5. **Enhancement Preservation Layer**:
   ```yaml
   # Protection mapping for SDD exclusive features
   sdd_enhancements:
     quality_automation:
       - commands/quality/code-validate.md
       - commands/quality/docs-sync.md
       - commands/quality/setup-hooks.md
     tdd_integration:
       - commands/tdd/*.md
     mcp_integration:
       - commands/mcp/*.md
     advanced_checklists:
       - templates/testing-checklist.md
       - samples/*/checklists/*.md
   ```

6. **Intelligent Merge Resolution**:
   - **Feature Parity**: Merge spec-kit features that complement SDD
   - **Conflict Resolution**: Prefer SDD implementation when equivalent features exist
   - **Enhancement Integration**: Add spec-kit improvements to SDD features

### Phase 3: Validation & Rollback

7. **Automated Testing Suite**:
   ```bash
   # Comprehensive validation pipeline
   test_core_workflow() {
     /sdd.specify "Auto-update validation test"
     /sdd.plan "Test tech stack"
     /sdd.tasks
     /sdd.implement
   }

   test_sdd_enhancements() {
     /sdd.code-validate --test-mode
     /sdd.setup-hooks --test
     /sdd.tdd.specify --dry-run
     /mcp.resolve --test-library
   }
   ```

8. **Progressive Rollback System**:
   - Create Git commits after each successful update phase
   - Tag rollback points for quick recovery
   - Maintain differential patches for manual intervention

## Automation Features:

### **Smart Conflict Resolution**
```yaml
conflict_resolution_strategies:
  yaml_frontmatter:
    - Merge compatible fields
    - Prefer SDD handoff patterns
    - Add spec-kit improvements as enhancements

  workflow_changes:
    - Detect breaking changes
    - Request user confirmation
    - Provide migration paths

  template_updates:
    - Preserve SDD template structure
    - Integrate spec-kit improvements
    - Maintain backward compatibility
```

### **Enhancement Mapping**
```python
enhancement_mapping = {
    # SDD features to preserve and potentially enhance
    "code-validation": {
        "sdd_file": "commands/quality/code-validate.md",
        "spec-kit_equivalent": None,  # SDD exclusive
        "enhancement_opportunity": "integrate new linting rules"
    },
    "tdd-workflow": {
        "sdd_file": "commands/tdd/implement.md",
        "spec-kit_equivalent": "basic testing",
        "enhancement_opportunity": "add spec-kit test patterns"
    }
}
```

### **Update Categories**
1. **🟢 Safe Auto-Apply** - Non-breaking improvements
2. **🟡 Smart Merge** - Features that need intelligent integration
3. **🔴 Manual Review** - Potential breaking changes requiring approval

## Usage Examples:

### **Basic Auto-Update** (Safe Mode)
```bash
/sdd.auto-update-spec-kit --mode safe
# Only applies non-breaking spec-kit improvements
# Preserves all existing functionality
# Minimal user interaction required
```

### **Enhanced Auto-Update** (Smart Mode)
```bash
/sdd.auto-update-spec-kit --mode smart
# Intelligent conflict resolution
# Integrates compatible new features
# Requests approval for significant changes
```

### **Full Auto-Update** (Advanced Mode)
```bash
/sdd.auto-update-spec-kit --mode advanced --accept-enhancements
# Maximum integration of spec-kit features
# Automatic enhancement of existing SDD features
# Creates comprehensive update report
```

### **Dry Run Mode** (Preview)
```bash
/sdd.auto-update-spec-kit --dry-run --verbose
# Shows what would be changed without making modifications
# Detailed conflict analysis
# Enhancement opportunity report
```

## Advanced Options:

### **Selective Updates**
```bash
# Update specific components
/sdd.auto-update-spec-kit --update handoffs,documentation,agents
# Exclude specific areas
/sdd.auto-update-spec-kit --exclude samples,templates
```

### **Enhancement Integration**
```bash
# Automatically enhance SDD features with spec-kit improvements
/sdd.auto-update-spec-kit --enhance-existing --preserve-workflow
```

### **Backup & Recovery**
```bash
# Enhanced backup with detailed metadata
/sdd.auto-update-spec-kit --backup --metadata --rollback-point auto-update-$(date +%Y%m%d)
```

## Output Reports:

### **Update Summary**
```markdown
# Auto-Update Report: GitHub Spec Kit Integration

## 📊 Update Statistics
- **Files Analyzed**: 47
- **Safe Updates Applied**: 23
- **Smart Merges**: 8
- **Manual Reviews Required**: 2
- **SDD Enhancements Preserved**: 15/15 (100%)

## 🔄 Changes Applied
### Safe Auto-Applied (🟢)
- Updated YAML handoff patterns in 4 core commands
- Added 3 new AI agents to compatibility matrix
- Enhanced documentation with latest spec-kit practices

### Smart Merges (🟡)
- Integrated new validation patterns into SDD quality system
- Enhanced TDD workflow with spec-kit test strategies
- Updated MCP integration with new library resolution

### Manual Reviews Required (🔴)
- Breaking change in spec-kit workflow pattern
- New template structure requires SDD adaptation
```

### **Enhancement Opportunities**
```markdown
## 🚀 SDD Enhancement Opportunities Detected

1. **Quality Gates Enhancement**
   - Spec-Kit: New automated testing patterns
   - SDD Integration: Add to existing quality checklists
   - Impact: Improves testing coverage by 25%

2. **Agent Compatibility Expansion**
   - Spec-Kit: Support for 3 new AI agents
   - SDD Integration: Add to compatibility matrix
   - Impact: Expands multi-agent support

3. **Documentation Automation**
   - Spec-Kit: New auto-documentation features
   - SDD Integration: Enhance existing docs-sync
   - Impact: Reduces documentation overhead by 40%
```

## Safety Features:

### **Multi-Layer Validation**
1. **Pre-Update Validation**: Ensure current SDD is healthy
2. **Incremental Validation**: Test after each change group
3. **Post-Update Validation**: Comprehensive testing suite
4. **Rollback Validation**: Ensure rollback functionality works

### **Intelligent Backup**
```bash
# Enhanced backup with context
backup_sdd_system() {
    create_metadata_snapshot() {
        - Current configuration
        - Working feature matrix
        - Test results baseline
        - User preferences
    }

    create_incremental_backup() {
        - Only changed files
        - Compression optimized
        - Cloud backup option
    }
}
```

### **Progress Tracking**
- Real-time progress indicators
- Detailed logging at each step
- Error recovery suggestions
- User notification system

## Recovery Options:

### **Instant Rollback**
```bash
/sdd.rollback-auto-update --point latest --confirm
# Immediate rollback to previous working state
# Preserves any user data created during session
```

### **Selective Rollback**
```bash
/sdd.rollback-auto-update --component handoffs --confirm
# Rollback only specific changes
# Keep other updates that are working correctly
```

### **Enhanced Recovery**
```bash
/sdd.auto-update-spec-kit --recover --from-backup /path/to/backup
# Recover from specific backup point
# Validation and repair of corrupted files
```

This intelligent auto-update system ensures SDD stays current with GitHub Spec Kit evolution while automatically protecting and enhancing enterprise features through smart conflict resolution and comprehensive validation.