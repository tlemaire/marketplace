# Claude Proxy

Proxy server for Claude Code to use alternative AI providers.

## Quick Start

### Prerequisites
- NVIDIA GPUs (4x H100 recommended)
- vLLM installed
- Claude Code installed

### Setup
```bash
# 1. Install proxy
npm install

# 2. Configure environment
cp .env.example .env

# 3. Start vLLM (in separate terminal)
./examples/vllm-h100-config.sh

# 4. Start proxy server
npm run dev

# 5. Configure Claude Code
export ANTHROPIC_API_URL=http://localhost:3000/v1
export ANTHROPIC_API_KEY=proxy-key

# 6. Test
claude-code "Write a Python function"
```

**Note**: Keep vLLM and proxy running in separate terminals.

## Claude Code Configuration

### Environment Variables (Recommended)
```bash
export ANTHROPIC_API_URL=http://localhost:3000/v1
export ANTHROPIC_API_KEY=proxy-key
```

### Optional: Settings File
Create `~/.claude/settings.json` (optional):
```json
{
  "api_url": "http://localhost:3000/v1",
  "api_key": "proxy-key"
}
```

**Note**: No special Claude Code configuration needed - the proxy handles API translation automatically.

## Configuration

### vLLM Setup (.env)
```env
PORT=3000
DEFAULT_PROVIDER=vllm
VLLM_BASE_URL=http://localhost:8000/v1
VLLM_MODEL=Qwen/Qwen3-Next
```

### Ollama Setup (.env)
```env
PORT=3000
DEFAULT_PROVIDER=ollama
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=qwen3-coder:30b
```

## Direct GLM 4.6 Integration (No Proxy Needed)

You can use GLM 4.6 directly with Claude Code through Z.AI without this proxy:

### Setup GLM 4.6 Directly
```bash
# Set environment variables
export ANTHROPIC_AUTH_TOKEN=your_zai_api_key
export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic

# Or add to ~/.claude/settings.json
{
  "api_key": "your_zai_api_key",
  "api_url": "https://api.z.ai/api/anthropic"
}
```

### Get GLM 4.6 Access
- 🚀 **Join the GLM Coding Plan**: Plans start at $3/month
- 🔗 **Subscribe**: https://z.ai/subscribe?ic=9KB0OPJIMF
- 💰 **Special Offer**: Subscribe link includes 10% discount
- 📚 **Documentation**: https://docs.z.ai/devpack/tool/claude

### Models Available
- **GLM-4.6**: Default model (Opus/Sonnet replacement)
- **GLM-4.5-Air**: Haiku replacement

**Note: This proxy is primarily for local models (vLLM/Ollama) or other cloud providers. GLM 4.6 works best when configured directly with Claude Code.**

## Testing

```bash
# Health check
curl http://localhost:3000/health

# Test proxy directly
curl -X POST http://localhost:3000/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "vllm/Qwen/Qwen3-Next",
    "messages": [{"role": "user", "content": "Hello!"}],
    "max_tokens": 100
  }'

```

## Troubleshooting

- **vLLM not running**: Start with `./examples/vllm-h100-config.sh`
- **Proxy not responding**: Check if proxy is running on port 3000
- **Connection refused**: Verify both services are running in separate terminals

## Development

```bash
npm run dev    # Development
npm run build  # Build
npm test       # Test
```

## License

ISC