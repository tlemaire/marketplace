import dotenv from 'dotenv';
import { ProxyConfig, ProviderConfig } from '../types';

dotenv.config();

export function loadConfig(): ProxyConfig {
  const port = parseInt(process.env.PORT || '3000', 10);
  const defaultProvider = process.env.DEFAULT_PROVIDER || 'ollama';

  const providers: Record<string, ProviderConfig> = {
    ollama: {
      name: 'ollama',
      baseUrl: process.env.OLLAMA_BASE_URL || 'http://localhost:11434',
      model: process.env.OLLAMA_MODEL || 'llama2',
    },
    openai: {
      name: 'openai',
      baseUrl: process.env.OPENAI_BASE_URL || 'https://api.openai.com/v1',
      apiKey: process.env.OPENAI_API_KEY,
      model: process.env.OPENAI_MODEL || 'gpt-3.5-turbo',
    },
    gemini: {
      name: 'gemini',
      baseUrl: 'https://generativelanguage.googleapis.com/v1beta',
      apiKey: process.env.GEMINI_API_KEY,
      model: process.env.GEMINI_MODEL || 'gemini-pro',
    },
    vllm: {
      name: 'vllm',
      baseUrl: process.env.VLLM_BASE_URL || 'http://localhost:8000/v1',
      apiKey: process.env.VLLM_API_KEY,
      model: process.env.VLLM_MODEL || 'default',
    },
    zai: {
      name: 'zai',
      baseUrl: process.env.ZAI_BASE_URL || 'https://api.z-ai.com/v1',
      apiKey: process.env.ZAI_API_KEY,
      model: process.env.ZAI_MODEL || 'z-ai-model',
    },
    glm: {
      name: 'glm',
      baseUrl: process.env.GLM_BASE_URL || 'https://api.z.ai/api/anthropic',
      apiKey: process.env.GLM_API_KEY,
      model: process.env.GLM_MODEL || 'GLM-4.6',
    },
  };

  // Parse model mapping from environment variables
  const modelMapping: Record<string, Record<string, string>> = {};

  // Helper function to parse model mapping
  const parseModelMapping = (envVar: string, provider: string) => {
    const mapping = process.env[envVar];
    if (mapping) {
      modelMapping[provider] = {};
      mapping.split(',').forEach((pair: string) => {
        const [claudeModel, providerModel] = pair.split(':');
        if (claudeModel && providerModel) {
          modelMapping[provider][claudeModel.trim()] = providerModel.trim();
        }
      });
    }
  };

  parseModelMapping('MODEL_MAPPING_OLLAMA', 'ollama');
  parseModelMapping('MODEL_MAPPING_OPENAI', 'openai');
  parseModelMapping('MODEL_MAPPING_GEMINI', 'gemini');
  parseModelMapping('MODEL_MAPPING_VLLM', 'vllm');
  parseModelMapping('MODEL_MAPPING_ZAI', 'zai');
  parseModelMapping('MODEL_MAPPING_GLM', 'glm');

  return {
    port,
    defaultProvider,
    providers,
    modelMapping,
  };
}

export const config = loadConfig();