---
description: Automatic library caching system for offline documentation access
shortcut: mcp.cache
shortcut_example: "/mcp.cache update --popular"
parameters:
  - name: action
    type: string
    required: true
    description: Cache action to perform (add, update, list, clean, auto, popular)
    examples:
      - add
      - update
      - list
      - clean
      - auto
      - popular
  - name: library
    type: string
    required: false
    description: Library name to cache (for add/update actions)
    examples:
      - React
      - TypeScript
      - Node.js
      - Express
      - PostgreSQL
  - name: scope
    type: string
    required: false
    description: Cache scope (popular, essential, comprehensive)
    examples:
      - popular
      - essential
      - comprehensive
  - name: auto
    type: boolean
    required: false
    description: Enable/disable automatic caching of used libraries
    examples:
      - true
      - false
examples:
  - description: Cache all popular libraries for offline use
    command: /mcp.cache update --scope popular
  - description: Add specific library to cache
    command: /mcp.cache add React
  - description: Update cached libraries with latest docs
    command: /mcp.cache update
  - description: List all cached libraries
    command: /mcp.cache list
  - description: Enable automatic caching
    command: /mcp.cache auto --enable true
---

# MCP Library Cache Management

**Purpose**: Automatic library caching system for offline documentation access with intelligent caching strategies.

## How It Works

This command implements a sophisticated caching system that:
- **Proactive Caching**: Pre-caches popular libraries when online
- **Reactive Caching**: Automatically caches libraries when used in SDD workflows
- **Smart Updates**: Refreshes cached documentation with latest versions
- **Storage Management**: Efficient cache organization and cleanup
- **Offline Access**: Provides cached documentation when offline

## Cache Actions

### 1. Cache Management
- **add**: Cache a specific library and its documentation
- **update**: Refresh cached libraries with latest documentation
- **list**: Show all cached libraries and their status
- **clean**: Remove old or invalid cache entries

### 2. Intelligent Caching
- **popular**: Cache most popular web development libraries
- **essential**: Cache core libraries (React, TypeScript, Node.js)
- **comprehensive**: Cache extensive library collection
- **auto**: Enable/disable automatic caching of used libraries

## Popular Library Collections

### Essential Libraries (--scope essential)
```bash
React, TypeScript, Node.js, Express, Next.js
```

### Popular Libraries (--scope popular)
```bash
Essential +:
Vue.js, Angular, Svelte, Tailwind CSS,
PostgreSQL, MongoDB, Redis, Docker,
Jest, Cypress, Webpack, Vite
```

### Comprehensive Collection (--scope comprehensive)
```bash
Popular +:
GraphQL, Apollo, Prisma, Supabase,
Firebase, AWS SDK, Stripe, Twilio,
Storybook, ESLint, Prettier, Husky
```

## Usage Examples

### Proactive Caching (When Online)
```bash
# Cache essential libraries for offline work
/mcp.cache update --scope essential

# Cache popular libraries
/mcp.cache update --scope popular

# Cache specific library
/mcp.cache add React
```

### Reactive Caching (Automatic)
```bash
# Enable automatic caching
/mcp.cache auto --enable true

# Now any library used in SDD workflows gets cached automatically
/sdd.specify "React app with authentication"
# → Automatically caches React documentation

/sdd.plan "TypeScript, Express, PostgreSQL"
# → Automatically caches TypeScript, Express, PostgreSQL
```

### Cache Management
```bash
# See what's cached
/mcp.cache list

# Update all cached libraries with latest docs
/mcp.cache update

# Clean old cache entries
/mcp.cache clean --older-than 30days

# Remove specific library from cache
/mcp.cache remove Express
```

## Integration with SDD Workflow

### Enhanced Planning Phase
```bash
# Before planning - ensure cache is ready
/mcp.cache list
/mcp.cache update --scope essential

# During planning - libraries auto-cached
/sdd.plan "React, TypeScript, Tailwind"
# → Automatically adds React, TypeScript, Tailwind to cache
```

### Offline Development
```bash
# Check cache status before going offline
/mcp.cache list --status

# Work offline with cached documentation
/mcp.docs "/vercel/next.js" --topic hooks  # From cache
/mcp.resolve React                         # From cache
```

## Cache Storage Structure

```
sdd/.cache/libraries/
├── react/
│   ├── metadata.json          # Library info, version, cached date
│   ├── library-id.json        # Context7 library ID
│   ├── docs-general.json      # General documentation
│   ├── docs-hooks.json        # Hooks-specific docs
│   └── docs-authentication.json # Topic-specific docs
├── typescript/
│   ├── metadata.json
│   ├── library-id.json
│   └── docs-config.json
└── nodejs/
    ├── metadata.json
    ├── library-id.json
    └── docs-modules.json
```

## Cache Metadata

Each cached library includes:
```json
{
  "library": "React",
  "context7_id": "/vercel/next.js/v18.2.0",
  "cached_date": "2025-01-22T10:30:00Z",
  "last_updated": "2025-01-22T10:30:00Z",
  "version": "18.2.0",
  "topics_cached": ["hooks", "authentication", "performance"],
  "size_bytes": 45320,
  "access_count": 12,
  "last_accessed": "2025-01-22T15:45:00Z"
}
```

## Performance Optimization

### Smart Caching Strategies
1. **Usage-Based Priority**: Frequently accessed libraries updated first
2. **Topic Caching**: Cache only relevant documentation topics
3. **Compression**: Compress cached documentation to save space
4. **Incremental Updates**: Only download changed documentation

### Memory Management
- **LRU Eviction**: Remove least recently used libraries when cache is full
- **Size Limits**: Configurable maximum cache size (default: 100MB)
- **Age-Based Cleanup**: Remove cache entries older than specified days

## Configuration

### Cache Settings
```bash
# Set maximum cache size (MB)
/mcp.cache config --max-size 200

# Set cache retention period (days)
/mcp.cache config --retention 60

# Enable automatic updates
/mcp.cache config --auto-update true

# Set update frequency (daily/weekly/monthly)
/mcp.cache config --update-frequency weekly
```

## Best Practices

### For Online Development
1. **Regular Updates**: Run `/mcp.cache update` weekly
2. **Essential First**: Cache essential libraries before others
3. **Topic Specific**: Cache specific topics for your projects

### For Offline Development
1. **Pre-Cache**: Before going offline, cache all needed libraries
2. **Verify Cache**: Check cache status before disconnecting
3. **Monitor Usage**: Use `/mcp.cache list --stats` to track usage

### Team Environments
1. **Shared Cache**: Commit cache directory for team sharing
2. **Version Control**: Include cache metadata in git
3. **Regular Sync**: Update cache regularly for latest documentation

## Troubleshooting

### Cache Issues
1. **Corrupted Cache**: Run `/mcp.cache clean --force` then update
2. **Missing Documentation**: Check internet connection and run update
3. **Outdated Cache**: Use `/mcp.cache update --force` for refresh
4. **Size Issues**: Use `/mcp.cache clean --aggressive` to free space

### Performance Issues
1. **Slow Cache**: Reduce cache size or enable compression
2. **High Memory**: Use LRU eviction or reduce retention period
3. **Network Issues**: Cache popular libraries when online

## Integration Examples

### Complete Offline Workflow
```bash
# Preparation (when online)
/mcp.cache update --scope comprehensive
/mcp.cache list --verify

# Development (offline)
/sdd.specify "React e-commerce app"
/mcp.docs "/vercel/next.js" --topic authentication  # From cache
/mcp.resolve TypeScript                              # From cache

# Quality Assurance
/mcp.diags --fix  # Uses IDE diagnostics (always available)
```

This caching system ensures you always have access to the documentation you need, whether online or offline, while maintaining the SDD philosophy of simplicity and efficiency.