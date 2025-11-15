import axios, { AxiosInstance } from 'axios';
import { Readable } from 'stream';
import { BaseProvider } from './base';
import {
  AnthropicRequest,
  AnthropicResponse,
  ProviderRequest,
  ProviderResponse,
  AnthropicStreamChunk,
  ProviderStreamChunk,
  ProxyError
} from '../types';
import { config } from '../config';

export class GLMProvider extends BaseProvider {
  private client: AxiosInstance;
  private baseUrl: string;
  private apiKey: string;
  private model: string;

  constructor() {
    const glmConfig = config.providers.glm;
    if (!glmConfig.apiKey) {
      throw new Error('GLM API key is required');
    }

    super(glmConfig);
    this.baseUrl = glmConfig.baseUrl;
    this.apiKey = glmConfig.apiKey;
    this.model = glmConfig.model;

    this.client = axios.create({
      baseURL: this.baseUrl,
      headers: {
        'Authorization': `Bearer ${this.apiKey}`,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...glmConfig.headers
      },
      timeout: 120000
    });
  }

  transformRequest(request: AnthropicRequest): ProviderRequest {
    return {
      model: this.mapModelName(request.model, config.modelMapping.glm || {}),
      messages: this.convertMessages(request.messages),
      temperature: request.temperature,
      max_tokens: request.max_tokens,
      stream: request.stream,
      system: request.system
    };
  }

  transformResponse(response: ProviderResponse): AnthropicResponse {
    return {
      id: this.generateId(),
      type: 'message',
      role: 'assistant',
      content: [
        {
          type: 'text',
          text: response.choices[0]?.message?.content || ''
        }
      ],
      model: response.model || this.model,
      stop_reason: this.getStopReason(response.choices[0]?.finish_reason || 'stop'),
      usage: {
        input_tokens: response.usage?.prompt_tokens || 0,
        output_tokens: response.usage?.completion_tokens || 0
      }
    };
  }

  transformStreamChunk(chunk: ProviderStreamChunk): AnthropicStreamChunk | null {
    if (!chunk.choices || chunk.choices.length === 0) {
      return null;
    }

    const choice = chunk.choices[0];

    if (choice.delta?.content) {
      return {
        type: 'content_block_delta',
        index: 0,
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
        usage: chunk.usage
      };
    }

    return null;
  }

  async createRequest(request: ProviderRequest): Promise<any> {
    try {
      const response = await this.client.post('/chat/completions', {
        model: request.model,
        messages: request.messages,
        temperature: request.temperature,
        max_tokens: request.max_tokens,
        system: request.system,
        stream: false
      });

      return response.data;
    } catch (error: any) {
      throw new ProxyError(
        `GLM API request failed: ${error.response?.data?.error?.message || error.message}`,
        error.response?.status || 500
      );
    }
  }

  async createStreamRequest(request: ProviderRequest): Promise<Readable> {
    try {
      const response = await this.client.post('/chat/completions', {
        model: request.model,
        messages: request.messages,
        temperature: request.temperature,
        max_tokens: request.max_tokens,
        system: request.system,
        stream: true
      }, {
        responseType: 'stream'
      });

      return response.data as Readable;
    } catch (error: any) {
      throw new ProxyError(
        `GLM API stream request failed: ${error.response?.data?.error?.message || error.message}`,
        error.response?.status || 500
      );
    }
  }
}