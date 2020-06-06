import {Entity, model, property} from '@loopback/repository';

@model()
export class Submission extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  @property({
    type: 'string',
  })
  description?: string;

  @property({
    type: 'number',
    default: 0,
  })
  numLikes?: number;

  @property({
    type: 'string',
  })
  country?: string;

  @property({
    type: 'string',
    required: true,
  })
  author: string;

  @property({
    type: 'array',
    itemType: 'string',
  })
  keywords?: string[];

  @property({
    type: 'array',
    itemType: 'any',
  })
  uploads?: any[];

  @property({
    type: 'number',
    default: 0,
  })
  problemId?: number;

  @property({
    type: 'array',
    itemType: 'any',
  })
  comments?: any[];

  constructor(data?: Partial<Submission>) {
    super(data);
  }
}

export interface SubmissionRelations {
  // describe navigational properties here
}

export type SubmissionWithRelations = Submission & SubmissionRelations;
