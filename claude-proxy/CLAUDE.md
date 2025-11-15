# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

Simple proxy server for Claude Code to use alternative AI providers, optimized for 4x H100 + Qwen3-Next setup.

## Architecture Principles

**KISS & YAGNI**: Keep it simple, remove unnecessary complexity.
- English-only codebase
- Minimal configuration
- Essential features only
- No over-engineering

### KISS (Keep It Simple, Stupid)
- All code must be English-only
- Remove unnecessary complexity
- Simple configuration files
- Minimal error handling
- Essential features only

### YAGNI (You Aren't Gonna Need It)
- Don't add features until actually needed
- Remove unused providers and configurations
- Focus on core functionality only
- Avoid over-engineering

## Current Setup

### Hardware Configuration
- **Server**: 4x NVIDIA H100 GPUs
- **Primary Model**: Qwen3-Next via vLLM
- **Alternative Model**: qwen3-coder:30b via Ollama
- **Proxy**: Express.js server
- **Integration**: Anthropic API compatibility

### Key Files Structure
```
src/
├── config/index.ts       # Environment configuration
├── providers/
│   ├── base.ts          # Base provider interface
│   ├── vllm.ts          # vLLM adapter (primary)
│   ├── ollama.ts        # Ollama adapter (alternative)
│   ├── openai.ts        # OpenAI adapter (alternative)
│   └── index.ts         # Provider factory
├── routes/messages.ts   # Main API endpoint
├── types/index.ts       # Type definitions
├── utils/
│   ├── anthropic-api.ts # Anthropic API compatibility
│   ├── errors.ts        # Error handling
│   └── performance.ts   # Performance monitoring
└── index.ts            # Server entry point
```

## Development Commands

```bash
npm install      # Install dependencies
npm run dev      # Development server
npm run build    # Build TypeScript
npm start        # Production server
```

## Configuration

### Environment Variables (.env)
```env
# Essential settings only
PORT=3000
DEFAULT_PROVIDER=vllm
VLLM_BASE_URL=http://localhost:8000/v1
VLLM_MODEL=Qwen/Qwen3-Next
```

### Ollama Alternative (.env.ollama)
```env
PORT=3000
DEFAULT_PROVIDER=ollama
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=qwen3-coder:30b
```

### GLM 4.6 Direct Integration
**No proxy needed** - Configure GLM 4.6 directly with Claude Code:
```bash
export ANTHROPIC_AUTH_TOKEN=your_zai_api_key
export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
```

**Get Access**: https://z.ai/subscribe?ic=9KB0OPJIMF (Plans from $3/month)

### vLLM Configuration (4x H100)
- `tensor-parallel-size 4` for multi-GPU
- `gpu-memory-utilization 0.95`
- `max-model-len 32768`
- `max-num-seqs 256`
- `enable-prefix-caching`

## Key Components

- **providers/vllm.ts**: vLLM adapter (primary)
- **providers/ollama.ts**: Ollama adapter (alternative)
- **providers/openai.ts**: OpenAI adapter (alternative)
- **routes/messages.ts**: Main API endpoint
- **utils/anthropic-api.ts**: API format translation

## Development Guidelines

### Code Standards
- English-only comments and documentation
- TypeScript for type safety
- Simple, readable functions
- Minimal dependencies
- No unnecessary abstractions

### Performance Focus
- High throughput for 4x H100 setup
- Streaming support for real-time responses
- Concurrent request handling
- Memory optimization

## Usage with Claude Code

```bash
export ANTHROPIC_API_URL=http://localhost:3000/v1
export ANTHROPIC_API_KEY=proxy-key
```

### Model Specification
- Use `vllm/Qwen/Qwen3-Next` for vLLM
- Use `ollama/qwen3-coder:30b` for Ollama
- Model mapping handled automatically

## Setup Options

### vLLM (4x H100)
```bash
./examples/vllm-h100-config.sh
```

### Ollama (qwen3-coder:30b)
```bash
./examples/ollama-qwen3-config.sh
```

## Future Considerations

### Potential Additions (only if needed)
- Authentication layer
- Rate limiting
- Additional providers (Gemini, etc.)
- Advanced monitoring

### Things to Avoid
- Complex configuration systems
- Unused provider implementations
- Overly detailed logging
- Unnecessary middleware

## Maintenance Notes

### Regular Tasks
- Keep dependencies minimal
- Monitor performance with benchmark script
- Update vLLM configuration as needed
- Maintain English-only codebase

### Troubleshooting
- Check vLLM/Ollama server status first
- Verify GPU availability
- Validate model configuration
- Check network connectivity to providers