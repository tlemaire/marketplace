---
description: Resolve library names to Context7-compatible library IDs for accurate documentation lookup
shortcut: mcp.resolve
shortcut_example: "/mcp.resolve React"
parameters:
  - name: library
    type: string
    required: true
    description: Library name to resolve (e.g., React, TypeScript, Node.js)
    examples:
      - React
      - TypeScript
      - Node.js
      - Express
      - PostgreSQL
examples:
  - description: Resolve React library ID
    command: /mcp.resolve React
  - description: Resolve TypeScript library ID
    command: /mcp.resolve TypeScript
  - description: Resolve Node.js library ID
    command: /mcp.resolve Node.js
---

# MCP Library Resolution

**Purpose**: Resolve library names to Context7-compatible library IDs for accurate documentation lookup and integration with SDD technical planning.

## How It Works

This command uses the Context7 MCP server to resolve library names to proper library identifiers that can be used for:
- Technical specification planning
- Documentation retrieval
- Library research
- Version management

## Parameters

- **library** (required): The name of the library you want to resolve

## Output

The command returns:
- **Library ID**: Context7-compatible library identifier
- **Description**: Brief description of the library
- **Documentation Coverage**: Available code snippets and documentation quality
- **Trust Score**: Reliability rating of the library information

## Examples

```bash
# Resolve React
/mcp.resolve React
# Returns: /vercel/next.js/v14.3.0-canary.87

# Resolve TypeScript
/mcp.resolve TypeScript
# Returns: appropriate TypeScript library ID

# Resolve Node.js
/mcp.resolve Node.js
# Returns: appropriate Node.js library ID
```

## Integration with SDD

This command enhances:
- **`/sdd.plan`**: Get accurate library information for technical specifications
- **`/sdd.specify`**: Research libraries during requirements specification
- **`/sdd.clarify`**: Validate library choices during clarification phases

## Best Practices

1. **Use specific names**: "React" instead of "react framework"
2. **Check alternatives**: If one resolution doesn't work, try variations
3. **Verify with docs**: Use resolved ID with `/mcp.get-docs` for documentation
4. **Keep records**: Save resolved IDs for consistent reference in projects