import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
  FilterBuilder,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {Submission} from '../models';
import {SubmissionRepository} from '../repositories';

export class SubmissionsController {
  constructor(
    @repository(SubmissionRepository)
    public submissionRepository : SubmissionRepository,
  ) {}

  @post('/submissions', {
    responses: {
      '200': {
        description: 'Submission model instance',
        content: {'application/json': {schema: getModelSchemaRef(Submission)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Submission, {
            title: 'NewSubmission',
            exclude: ['id'],
          }),
        },
      },
    })
    submission: Omit<Submission, 'id'>,
  ): Promise<Submission> {
    return this.submissionRepository.create(submission);
  }

  @get('/submissions/count', {
    responses: {
      '200': {
        description: 'Submission model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Submission) where?: Where<Submission>,
  ): Promise<Count> {
    return this.submissionRepository.count(where);
  }

  @get('/submissions', {
    responses: {
      '200': {
        description: 'Array of Submission model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Submission, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Submission) filter?: Filter<Submission>,
  ): Promise<Submission[]> {
    return this.submissionRepository.find(filter);
  }

  @patch('/submissions', {
    responses: {
      '200': {
        description: 'Submission PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Submission, {partial: true}),
        },
      },
    })
    submission: Submission,
    @param.where(Submission) where?: Where<Submission>,
  ): Promise<Count> {
    return this.submissionRepository.updateAll(submission, where);
  }

  @get('/submissions/{id}', {
    responses: {
      '200': {
        description: 'Submission model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Submission, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Submission, {exclude: 'where'}) filter?: FilterExcludingWhere<Submission>
  ): Promise<Submission> {
    return this.submissionRepository.findById(id, filter);
  }

  @patch('/submissions/{id}', {
    responses: {
      '204': {
        description: 'Submission PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Submission, {partial: true}),
        },
      },
    })
    submission: Submission,
  ): Promise<void> {
    await this.submissionRepository.updateById(id, submission);
  }

  @put('/submissions/{id}', {
    responses: {
      '204': {
        description: 'Submission PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() submission: Submission,
  ): Promise<void> {
    await this.submissionRepository.replaceById(id, submission);
  }

  @del('/submissions/{id}', {
    responses: {
      '204': {
        description: 'Submission DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.submissionRepository.deleteById(id);
  }

  @get('/submissions/highest/numlikes/{limit}', {
    responses: {
      '200': {
        description: 'Array of top submissions ranked based on number of likes',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Submission, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async findSubmissionsHighestNumLikes(
    @param.path.number('limit') limit: number,
  ): Promise<Submission[]> {
    let filter: FilterBuilder<Submission> = new FilterBuilder<Submission>({order: ['numLikes DESC'], where:{"numLikes": {gt: 0}}, limit: limit});
      
    const res = await this.submissionRepository.find(filter.filter);
    return res;
  }
}