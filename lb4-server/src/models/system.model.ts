import {Entity, model, property} from '@loopback/repository';

@model()
export class System extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'array',
    itemType: 'string',
    default: ["en"],
  })
  supportedLocales?: string[];

  @property({
    type: 'string',
    default: 'en',
  })
  currentLocale?: string;

  @property({
    type: 'object',
  })
  currentUser?: object;


  constructor(data?: Partial<System>) {
    super(data);
  }
}

export interface SystemRelations {
  // describe navigational properties here
}

export type SystemWithRelations = System & SystemRelations;
