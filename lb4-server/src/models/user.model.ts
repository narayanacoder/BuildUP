import {Entity, model, property} from '@loopback/repository';

@model()
export class User extends Entity {
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
  firstName: string;

  @property({
    type: 'string',
    required: true,
  })
  lastName: string;

  @property({
    type: 'string',
  })
  description: string;

  @property({
    type: 'number',
  })
  phoneNumber?: number;

  @property({
    type: 'string',
    required: true,
  })
  country: string;

  @property({
    type: 'string',
  })
  email?: string;

  @property({
    type: 'array',
    itemType: 'string',
  })
  saved?: string[];

  @property({
    type: 'array',
    itemType: 'string',
  })
  submitted?: string[];

  @property({
    type: 'array',
    itemType: 'string',
  })
  favorites?: string[];

  @property({
    type: 'string',
  })
  profilePic?: string;


  constructor(data?: Partial<User>) {
    super(data);
  }
}

export interface UserRelations {
  // describe navigational properties here
}

export type UserWithRelations = User & UserRelations;
