---
description: Fetch up-to-date documentation for libraries using Context7 for technical planning and implementation
shortcut: mcp.docs
shortcut_example: "/mcp.docs React --topic hooks"
parameters:
  - name: library_id
    type: string
    required: true
    description: Context7-compatible library ID (use /mcp.resolve to get ID)
    examples:
      - "/vercel/next.js"
      - "/mongodb/docs"
      - "/supabase/supabase"
  - name: topic
    type: string
    required: false
    description: Specific topic to focus documentation on (e.g., hooks, routing, authentication)
    examples:
      - hooks
      - routing
      - authentication
      - testing
  - name: tokens
    type: number
    required: false
    description: Maximum number of tokens of documentation to retrieve (default: 10000)
    examples:
      - 5000
      - 15000
      - 20000
examples:
  - description: Get React documentation
    command: /mcp.docs "/vercel/next.js"
  - description: Get React hooks documentation
    command: /mcp.docs "/vercel/next.js" --topic hooks
  - description: Get extensive documentation
    command: /mcp.docs "/mongodb/docs" --tokens 15000
---

# MCP Documentation Retrieval

**Purpose**: Fetch up-to-date documentation for libraries using Context7 to enhance technical planning, implementation, and clarification phases in SDD.

## How It Works

This command uses the Context7 MCP server to retrieve current documentation from:
- Official library documentation
- API references
- Code examples
- Best practices
- Version-specific information

## Parameters

- **library_id** (required): Context7-compatible library ID (use `/mcp.resolve` to get proper ID)
- **topic** (optional): Focus documentation on specific topics
- **tokens** (optional): Control documentation length (default: 10000 tokens)

## Output

The command returns:
- **Comprehensive Documentation**: Current API references and guides
- **Code Examples**: Practical implementation examples
- **Best Practices**: Recommended patterns and approaches
- **Version Information**: Latest features and deprecations

## Examples

```bash
# Get React documentation
/mcp.docs "/vercel/next.js"

# Focus on React hooks
/mcp.docs "/vercel/next.js" --topic hooks

# Get extensive MongoDB documentation
/mcp.docs "/mongodb/docs" --tokens 15000

# Get authentication documentation
/mcp.docs "/supabase/supabase" --topic authentication
```

## Integration with SDD

This command enhances multiple SDD phases:

### Planning Phase
```bash
# Before planning, research libraries
/mcp.resolve Express
/mcp.docs "/express/docs" --topic routing
/sdd.plan "Express.js REST API with authentication"
```

### Specification Phase
```bash
# During specification, get detailed docs
/mcp.docs "/vercel/next.js" --topic authentication
/sdd.specify "Add user authentication to Next.js app"
```

### Implementation Phase
```bash
# During implementation, reference specific docs
/mcp.docs "/testing-library/docs" --topic react-testing
/sdd.implement "Add comprehensive test suite"
```

## Best Practices

1. **Always resolve first**: Use `/mcp.resolve` to get correct library IDs
2. **Focus with topics**: Use topic parameter for targeted documentation
3. **Manage token limits**: Adjust tokens for comprehensive vs focused documentation
4. **Version awareness**: Be aware of version-specific features
5. **Cross-reference**: Combine multiple library docs for integrated solutions

## Library ID Examples

Common library IDs (always verify with `/mcp.resolve`):
- `/vercel/next.js` - Next.js
- `/mongodb/docs` - MongoDB
- `/supabase/supabase` - Supabase
- `/express/docs` - Express.js (example)
- `/react/docs` - React (example)

## Error Handling

If documentation retrieval fails:
1. Verify library ID with `/mcp.resolve`
2. Check internet connection for current docs
3. Try alternative library names
4. Use broader topic search instead of specific topics