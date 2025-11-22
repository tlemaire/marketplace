---
description: Get real-time language diagnostics and code quality feedback from VS Code for enhanced validation
shortcut: mcp.diags
shortcut_example: "/mcp.diags --file src/components/User.tsx"
parameters:
  - name: file
    type: string
    required: false
    description: Specific file path to get diagnostics for (optional, gets all files if not specified)
    examples:
      - src/components/User.tsx
      - src/api/routes.js
      - lib/database.py
  - name: severity
    type: string
    required: false
    description: Filter by severity level (error, warning, info, hint)
    examples:
      - error
      - warning
      - info
      - hint
  - name: fix
    type: boolean
    required: false
    description: Attempt to auto-fix diagnostic issues where possible
    examples:
      - true
      - false
examples:
  - description: Get diagnostics for all files
    command: /mcp.diags
  - description: Get diagnostics for specific file
    command: /mcp.diags --file src/components/User.tsx
  - description: Get only error-level diagnostics
    command: /mcp.diags --severity error
  - description: Get diagnostics and attempt fixes
    command: /mcp.diags --fix
---

# MCP IDE Diagnostics

**Purpose**: Get real-time language diagnostics and code quality feedback from VS Code to enhance validation and quality assurance in SDD workflows.

## How It Works

This command uses the VS Code MCP server integration to provide:
- **Real-time Diagnostics**: Live code analysis and error detection
- **Language-specific Analysis**: TypeScript, JavaScript, Python, and more
- **Quality Metrics**: Code quality, style violations, and best practices
- **Auto-fix Suggestions**: Automated issue resolution where possible
- **Integration-friendly**: Works with existing SDD validation workflows

## Parameters

- **file** (optional): Specific file to analyze (analyzes all project files if not specified)
- **severity** (optional): Filter diagnostics by severity level
- **fix** (optional): Attempt automatic fixes for detected issues

## Output

The command provides:
- **Error Detection**: Syntax errors, type errors, compilation issues
- **Warning Analysis**: Potential problems, deprecated usage, performance issues
- **Information**: Style suggestions, best practice recommendations
- **Hints**: Code improvements and optimization opportunities
- **Auto-fix Results**: Successfully applied automatic fixes

## Examples

### 1. Full Project Analysis
```bash
# Get all project diagnostics
/mcp.diags

# Analyze and auto-fix issues
/mcp.diags --fix
```

### 2. File-specific Analysis
```bash
# Check specific component
/mcp.diags --file src/components/User.tsx

# Check API routes
/mcp.diags --file src/api/routes.js
```

### 3. Severity Filtering
```bash
# Get only critical errors
/mcp.diags --severity error

# Get warnings and above
/mcp.diags --severity warning
```

## Integration with SDD

### Enhanced Validation
```bash
# Enhanced project validation
/mcp.diags --severity error
/sdd.validate
```

### Quality Assurance
```bash
# Comprehensive quality check
/mcp.diags --severity warning
/sdd.quality.analyze
/sdd.quality.checklist
```

### TDD Integration
```bash
# After test implementation
/sdd.tdd.implement
/mcp.diags --file test/user.test.ts
```

### Pre-commit Validation
```bash
# Before committing changes
/mcp.diags --fix
/mcp.diags --severity error
git add .
git commit -m "Implement feature with code quality validation"
```

## Diagnostic Categories

### 1. Compilation Errors
- Syntax errors
- Type mismatches
- Import/export issues
- Missing dependencies

### 2. Code Quality Issues
- Unused variables
- Dead code
- Code complexity
- Naming conventions

### 3. Best Practices
- Security vulnerabilities
- Performance issues
- Accessibility concerns
- Style guide violations

### 4. TypeScript-specific
- Type inference issues
- Interface mismatches
- Generic type problems
- Strict mode violations

## Auto-fix Capabilities

The `--fix` flag can automatically resolve:
- **Import organization**: Sort and optimize imports
- **Formatting fixes**: Apply code formatting rules
- **Unused imports**: Remove unused import statements
- **Simple syntax**: Fix basic syntax errors
- **Missing semicolons**: Add required semicolons

## Best Practices

1. **Regular Validation**: Run diagnostics frequently during development
2. **Severity Progression**: Start with errors, then address warnings
3. **File-specific Focus**: Use file parameter for targeted analysis
4. **Pre-commit Checks**: Include diagnostics in commit hooks
5. **Integration**: Combine with SDD validation for comprehensive checks

## Severity Levels

- **Error**: Critical issues preventing compilation or execution
- **Warning**: Problems that may cause issues or violate best practices
- **Info**: Suggestions for improvement and optimization
- **Hint**: Minor improvements and code style recommendations

## Error Examples

### TypeScript
```typescript
// Error: Type mismatch
const user: User = "invalid"; // Type 'string' is not assignable to type 'User'

// Warning: Unused variable
const unusedVar = 42; // 'unusedVar' is declared but never used
```

### JavaScript
```javascript
// Error: Syntax issue
const obj = { name: "John", }; // Unexpected trailing comma

// Warning: Potential issue
if (x = y) { // Possible typo - assignment in condition
```

## Configuration

Diagnostics can be customized through:
- **VS Code settings**: Configure language-specific rules
- **ESLint/TSLint**: Add project-specific linting rules
- **Prettier**: Configure code formatting preferences
- **Compiler options**: Set strictness levels and target versions

## Performance Considerations

- **Large Projects**: Use file-specific analysis for faster results
- **Incremental Analysis**: Focus on changed files
- **Background Processing**: Run diagnostics during idle time
- **Resource Limits**: Monitor memory and CPU usage during analysis