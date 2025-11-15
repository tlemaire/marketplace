import axios, { AxiosResponse } from 'axios';
import { Readable } from 'stream';
import { BaseProvider } from './base';
import {
  AnthropicRequest,
  AnthropicResponse,
  ProviderRequest,
  ProviderResponse,
  AnthropicStreamChunk,
  ProviderStreamChunk
} from '../types';
import { config } from '../config';

export class OllamaProvider extends BaseProvider {
  private baseUrl: string;
  private model: string;

  constructor() {
    super(config.providers.ollama);
    this.baseUrl = config.providers.ollama.baseUrl;
    this.model = config.providers.ollama.model;
  }

  transformRequest(request: AnthropicRequest): ProviderRequest {
    const mappedModel = this.mapModelName(request.model, config.modelMapping.ollama || {});

    return {
      model: mappedModel || this.model,
      messages: this.convertMessages(request.messages),
      temperature: request.temperature,
      max_tokens: request.max_tokens,
      stream: request.stream || false,
      system: request.system
    };
  }

  transformResponse(response: ProviderResponse): AnthropicResponse {
    const choice = response.choices[0];

    return {
      id: this.generateId(),
      type: 'message',
      role: 'assistant',
      content: [
        {
          type: 'text',
          text: choice.message.content
        }
      ],
      model: response.model,
      stop_reason: this.getStopReason(choice.finish_reason),
      usage: {
        input_tokens: response.usage?.prompt_tokens || 0,
        output_tokens: response.usage?.completion_tokens || 0
      }
    };
  }

  transformStreamChunk(chunk: ProviderStreamChunk): AnthropicStreamChunk | null {
    const choice = chunk.choices[0];

    if (!choice) return null;

    if (choice.delta.content) {
      return {
        type: 'content_block_delta',
        delta: {
          type: 'text_delta',
          text: choice.delta.content
        }
      };
    }

    if (choice.finish_reason) {
      return {
        type: 'message_delta',
        delta: {
          stop_reason: this.getStopReason(choice.finish_reason)
        },
        usage: chunk.usage ? {
          input_tokens: chunk.usage.prompt_tokens || 0,
          output_tokens: chunk.usage.completion_tokens || 0
        } : undefined
      };
    }

    return null;
  }

  async createRequest(request: ProviderRequest): Promise<ProviderResponse> {
    try {
      const response: AxiosResponse = await axios.post(
        `${this.baseUrl}/chat/completions`,
        {
          model: request.model,
          messages: request.messages,
          temperature: request.temperature,
          max_tokens: request.max_tokens,
          stream: false
        },
        {
          headers: {
            'Content-Type': 'application/json'
          }
        }
      );

      return response.data;
    } catch (error: any) {
      throw new Error(`Ollama API error: ${error.response?.data?.error || error.message}`);
    }
  }

  async createStreamRequest(request: ProviderRequest): Promise<Readable> {
    const response = await axios.post(
      `${this.baseUrl}/chat/completions`,
      {
        model: request.model,
        messages: request.messages,
        temperature: request.temperature,
        max_tokens: request.max_tokens,
        stream: true
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'text/event-stream'
        },
        responseType: 'stream'
      }
    );

    return response.data;
  }
}