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

export class OpenAIProvider extends BaseProvider {
  private baseUrl: string;
  private apiKey: string;
  private model: string;

  constructor() {
    super(config.providers.openai);
    this.baseUrl = config.providers.openai.baseUrl;
    this.apiKey = config.providers.openai.apiKey || '';
    this.model = config.providers.openai.model;
  }

  transformRequest(request: AnthropicRequest): ProviderRequest {
    const mappedModel = this.mapModelName(request.model, config.modelMapping.openai || {});

    return {
      model: mappedModel || this.model,
      messages: this.convertMessages(request.messages),
      temperature: request.temperature,
      max_tokens: request.max_tokens,
      stream: request.stream || false
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
        input_tokens: response.usage.prompt_tokens,
        output_tokens: response.usage.completion_tokens
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
          input_tokens: chunk.usage.prompt_tokens,
          output_tokens: chunk.usage.completion_tokens
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
            'Authorization': `Bearer ${this.apiKey}`,
            'Content-Type': 'application/json'
          }
        }
      );

      return response.data;
    } catch (error: any) {
      throw new Error(`OpenAI API error: ${error.response?.data?.error?.message || error.message}`);
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
          'Authorization': `Bearer ${this.apiKey}`,
          'Content-Type': 'application/json',
          'Accept': 'text/event-stream'
        },
        responseType: 'stream'
      }
    );

    return response.data;
  }
}