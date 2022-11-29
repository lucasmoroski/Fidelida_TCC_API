import { Injectable } from '@angular/core';

import { IMessage } from '@fidelity/interfaces/message.interface';

@Injectable({
  providedIn: 'root'
})
export class MessageService {

  public messages: IMessage[] = [];

  constructor() { }

  addMessage(message: IMessage): void {
    this.messages.push(message);
  }

  close(): void {
    this.messages = [];
  }
}
