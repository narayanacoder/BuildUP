import {model, property} from '@loopback/repository';
import {Submission} from '.';

@model()
export class Problem extends Submission {
  @property({
    type: 'date',
  })
  deadline?: string;


  constructor(data?: Partial<Problem>) {
    super(data);
  }
}

export interface ProblemRelations {
  // describe navigational properties here
}

export type ProblemWithRelations = Problem & ProblemRelations;
