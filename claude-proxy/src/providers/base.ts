import {
  AnthropicRequest,
  AnthropicResponse,
  ProviderRequest,
  ProviderResponse,
  AnthropicStreamChunk,
  ProviderStreamChunk
} from '../types';
import { Readable } from 'stream';

export abstract class BaseProvider {
  protected config: any;

  constructor(config: any) {
    this.config = config;
  }

  abstract transformRequest(request: AnthropicRequest): ProviderRequest;
  abstract transformResponse(response: ProviderResponse): AnthropicResponse;
  abstract transformStreamChunk(chunk: ProviderStreamChunk): AnthropicStreamChunk | null;

  abstract createRequest(request: ProviderRequest): Promise<any>;
  abstract createStreamRequest(request: ProviderRequest): Promise<Readable>;

  protected mapModelName(claudeModel: string, modelMapping: Record<string, string>): string {
    return modelMapping[claudeModel] || claudeModel;
  }

  protected extractTextContent(anthropicMessages: any[]): string {
    return anthropicMessages
      .filter(msg => msg.role === 'user')
      .map(msg =>
        msg.content
          .filter((content: any) => content.type === 'text')
          .map((content: any) => content.text)
          .join('\n')
      )
      .join('\n\n');
  }

  protected convertMessages(anthropicMessages: any[]): Array<{ role: string; content: string }> {
    return anthropicMessages.map(msg => ({
      role: msg.role,
      content: this.extractTextContent([msg])
    }));
  }

  protected generateId(): string {
    return `msg_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }

  protected getStopReason(finishReason: string): 'end_turn' | 'max_tokens' | 'stop_sequence' {
    switch (finishReason) {
      case 'length':
      case 'max_tokens':
        return 'max_tokens';
      case 'stop':
        return 'end_turn';
      default:
        return 'end_turn';
    }
  }
}