import { BaseProvider } from './base';
import { OllamaProvider } from './ollama';
import { OpenAIProvider } from './openai';
import { VLLMProvider } from './vllm';
import { GLMProvider } from './glm';
import { config } from '../config';

export class ProviderFactory {
  static createProvider(providerName: string): BaseProvider {
    switch (providerName.toLowerCase()) {
      case 'ollama':
        return new OllamaProvider();
      case 'openai':
        return new OpenAIProvider();
      case 'vllm':
        return new VLLMProvider();
      case 'glm':
        return new GLMProvider();
      // TODO: Add more providers
      // case 'gemini':
      //   return new GeminiProvider();
      // case 'zai':
      //   return new ZAIProvider();
      default:
        throw new Error(`Unsupported provider: ${providerName}`);
    }
  }

  static getSupportedProviders(): string[] {
    return ['ollama', 'openai', 'vllm', 'glm'];
  }

  static validateProvider(providerName: string): boolean {
    return this.getSupportedProviders().includes(providerName.toLowerCase());
  }
}

export { BaseProvider, OllamaProvider, OpenAIProvider, VLLMProvider, GLMProvider };