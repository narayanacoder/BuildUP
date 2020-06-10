import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
  FilterBuilder
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
import {Problem} from '../models';
import {ProblemRepository} from '../repositories';

export class ProblemsController {
  constructor(
    @repository(ProblemRepository)
    public problemRepository : ProblemRepository,
  ) {}

  @post('/problems', {
    responses: {
      '200': {
        description: 'Problem model instance',
        content: {'application/json': {schema: getModelSchemaRef(Problem)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Problem, {
            title: 'NewProblem',
            exclude: ['id'],
          }),
        },
      },
    })
    problem: Omit<Problem, 'id'>,
  ): Promise<Problem> {
    return this.problemRepository.create(problem);
  }

  @get('/problems/count', {
    responses: {
      '200': {
        description: 'Problem model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Problem) where?: Where<Problem>,
  ): Promise<Count> {
    return this.problemRepository.count(where);
  }

  @get('/problems', {
    responses: {
      '200': {
        description: 'Array of Problem model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Problem, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Problem) filter?: Filter<Problem>,
  ): Promise<Problem[]> {
    return this.problemRepository.find(filter);
  }

  @patch('/problems', {
    responses: {
      '200': {
        description: 'Problem PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Problem, {partial: true}),
        },
      },
    })
    problem: Problem,
    @param.where(Problem) where?: Where<Problem>,
  ): Promise<Count> {
    return this.problemRepository.updateAll(problem, where);
  }

  @get('/problems/{id}', {
    responses: {
      '200': {
        description: 'Problem model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Problem, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Problem, {exclude: 'where'}) filter?: FilterExcludingWhere<Problem>
  ): Promise<Problem> {
    return this.problemRepository.findById(id, filter);
  }

  @patch('/problems/{id}', {
    responses: {
      '204': {
        description: 'Problem PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Problem, {partial: true}),
        },
      },
    })
    problem: Problem,
  ): Promise<void> {
    await this.problemRepository.updateById(id, problem);
  }

  @put('/problems/{id}', {
    responses: {
      '204': {
        description: 'Problem PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() problem: Problem,
  ): Promise<void> {
    await this.problemRepository.replaceById(id, problem);
  }

  @del('/problems/{id}', {
    responses: {
      '204': {
        description: 'Problem DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.problemRepository.deleteById(id);
  }

  @get('/problems/highest/numlikes/{limit}', {
    responses: {
      '200': {
        description: 'Array of top problems ranked based on number of likes',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Problem, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async findProblemsHighestNumLikes(
    @param.path.number('limit') limit: number,
  ): Promise<Problem[]> {
    let filter: FilterBuilder<Problem> = new FilterBuilder<Problem>({order: ['numLikes DESC'], where:{"numLikes": {gt: 0}}, limit: limit});
      
    const res = await this.problemRepository.find(filter.filter);
    return res;
  }

  @get('/problems/problemId/{problemid}', {
    responses: {
      '200': {
        description: 'Array of problems with matching problemid',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Problem, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async getProblemsWithProblemId(
    @param.path.number('problemid') problemid: number,
  ): Promise<Problem[]> {
    let filter: FilterBuilder<Problem> = new FilterBuilder<Problem>({where:{"problemId": {eq: problemid}}});
      
    const res = await this.problemRepository.find(filter.filter);
    return res;
  }
}
