---
description: Display comprehensive help and documentation for all available MCP commands in SDD
shortcut: mcp.help
shortcut_example: "/mcp.help"
parameters:
  - name: command
    type: string
    required: false
    description: Specific MCP command to get detailed help for
    examples:
      - resolve
      - docs
      - browser
      - diags
examples:
  - description: Show all MCP commands overview
    command: /mcp.help
  - description: Get detailed help for browser testing
    command: /mcp.help browser
  - description: Get detailed help for documentation retrieval
    command: /mcp.help docs
---

# MCP Commands Help

**Purpose**: Display comprehensive help and documentation for all Model Context Protocol commands available in SDD.

## Available MCP Commands

Your SDD installation includes **4 MCP command categories** with **7 individual commands**:

### 📚 Documentation & Research Commands

#### `/mcp.resolve` or `/mcp.resolve-library`
- **Purpose**: Resolve library names to Context7-compatible library IDs
- **Use Case**: Get accurate library identifiers for documentation lookup
- **Example**: `/mcp.resolve React`

#### `/mcp.docs` or `/mcp.get-docs`
- **Purpose**: Fetch up-to-date library documentation
- **Use Case**: Research APIs, best practices, and implementation examples
- **Example**: `/mcp.docs "/vercel/next.js" --topic hooks`

### 🧪 Testing & Quality Commands

#### `/mcp.browser` or `/mcp.browser-test`
- **Purpose**: Automated browser testing and web application validation
- **Use Case**: E2E testing, responsive design, UI interaction testing
- **Example**: `/mcp.browser test --url http://localhost:3000 --device "iPhone 15"`

#### `/mcp.diags` or `/mcp.ide-diagnostics`
- **Purpose**: Real-time code diagnostics and quality feedback
- **Use Case**: Error detection, code quality, best practice validation
- **Example**: `/mcp.diags --severity error --fix`

### 💾 Cache Management Commands

#### `/mcp.cache`
- **Purpose**: Automatic library caching for offline documentation access
- **Use Case**: Cache libraries proactively or reactively for offline work
- **Example**: `/mcp.cache update --scope popular`

### 🔧 Utility Commands

#### `/mcp.help` (this command)
- **Purpose**: Display help documentation for MCP commands
- **Use Case**: Command reference and usage examples

## MCP Servers Available

### Context7 MCP Server (@upstash/context7-mcp)
- **Functions**: Library resolution, documentation retrieval
- **Status**: ✅ Installed locally
- **Commands**: `resolve-library`, `get-docs`

### Playwright MCP Server (@playwright/mcp)
- **Functions**: Browser automation, testing, screenshots
- **Status**: ✅ Installed locally
- **Commands**: `browser-test`

### VS Code MCP Server (built-in)
- **Functions**: Language diagnostics, code analysis
- **Status**: ✅ Built-in to Claude Code
- **Commands**: `ide-diagnostics`

### SDD Cache System (built-in)
- **Functions**: Automatic library caching and offline documentation
- **Status**: ✅ Built into SDD MCP commands
- **Commands**: `cache`

## Integration with SDD Workflow

### 1. Specification Phase
```bash
# Research libraries for specification
/mcp.resolve React
/mcp.docs "/vercel/next.js" --topic authentication
/mcp.cache add React  # Cache for offline use
/sdd.specify "Implement React authentication system"
```

### 2. Planning Phase
```bash
# Get accurate library information
/mcp.resolve Express
/mcp.docs "/express/docs" --topic middleware
/sdd.plan "Express.js REST API with middleware"
```

### 3. Implementation Phase
```bash
# Get implementation documentation
/mcp.docs "/testing-library/docs" --topic react-testing
/sdd.implement "Add comprehensive test suite"
```

### 4. Quality Assurance Phase
```bash
# Code quality validation
/mcp.diags --severity error
/mcp.diags --fix
/sdd.validate
/sdd.quality.checklist
```

### 5. Testing Phase
```bash
# Automated browser testing
/mcp.browser test --url http://localhost:3000
/mcp.browser test --url http://localhost:3000 --device "iPhone 15"
```

## Command Quick Reference

| Command | Function | Example |
|---------|----------|---------|
| `/mcp.resolve React` | Library resolution | Get Context7 ID for React |
| `/mcp.docs "/lib/id"` | Documentation | Get library docs |
| `/mcp.browser test` | Browser testing | Full application test |
| `/mcp.diags --fix` | Code diagnostics | Fix code issues |
| `/mcp.cache update` | Cache management | Cache libraries for offline |
| `/mcp.help` | Help documentation | Show this help |

## Best Practices

### 1. Research First
- Always use `/mcp.resolve` before `/mcp.docs` for accurate library IDs
- Check documentation before implementing features
- Verify current API versions and best practices
- **Cache libraries**: Use `/mcp.cache add` after research for offline access

### 2. Quality Integration
- Run `/mcp.diags` before `/sdd.validate` for comprehensive validation
- Use `--fix` flag to auto-resolve common issues
- Check multiple severity levels progressively

### 3. Testing Strategy
- Test on multiple devices with `/mcp.browser`
- Combine manual and automated testing
- Use test IDs for reliable element selection

### 4. Documentation Management
- Save useful library IDs for project reference
- Bookmark documentation sections for frequent access
- Keep documentation up-to-date with latest versions

## Troubleshooting

### Context7 Issues
1. **Library not found**: Try alternative library names
2. **Documentation unavailable**: Check internet connection
3. **Invalid library ID**: Use `/mcp.resolve` to get correct ID

### Playwright Issues
1. **Browser not found**: Install required browser with `npx playwright install`
2. **Element not found**: Verify selectors and wait times
3. **Permission denied**: Check browser permissions and settings

### IDE Diagnostics Issues
1. **No diagnostics**: Ensure VS Code is open and files are loaded
2. **Language not supported**: Check language server extensions
3. **Performance issues**: Use file-specific analysis for large projects

## Getting More Help

For specific command help:
```bash
/mcp.help resolve    # Library resolution help
/mcp.help docs       # Documentation help
/mcp.help browser    # Browser testing help
/mcp.help diags      # Diagnostics help
/mcp.help cache      # Cache management help
```

For general SDD help:
```bash
/sdd.help            # SDD comprehensive help
/sdd.help core       # Core commands help
/sdd.help quality    # Quality commands help
/sdd.help tdd        # TDD commands help
```