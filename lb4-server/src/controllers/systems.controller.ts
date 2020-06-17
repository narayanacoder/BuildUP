import {
  Count,
  CountSchema,
  Filter,

  FilterBuilder, FilterExcludingWhere,

  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,


  patch, post,




  put,

  requestBody
} from '@loopback/rest';
import {System, User} from '../models';
import {SystemRepository} from '../repositories';

export class SystemsController {
  constructor(
    @repository(SystemRepository)
    public systemRepository: SystemRepository,
  ) {}

  @post('/systems', {
    responses: {
      '200': {
        description: 'System model instance',
        content: {'application/json': {schema: getModelSchemaRef(System)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(System, {
            title: 'NewSystem',
            exclude: ['id'],
          }),
        },
      },
    })
    system: Omit<System, 'id'>,
  ): Promise<System> {
    return this.systemRepository.create(system);
  }

  @get('/systems/count', {
    responses: {
      '200': {
        description: 'System model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(System) where?: Where<System>,
  ): Promise<Count> {
    return this.systemRepository.count(where);
  }

  @get('/systems', {
    responses: {
      '200': {
        description: 'Array of System model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(System, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(System) filter?: Filter<System>,
  ): Promise<System[]> {
    return this.systemRepository.find(filter);
  }

  @patch('/systems', {
    responses: {
      '200': {
        description: 'System PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(System, {partial: true}),
        },
      },
    })
    system: System,
    @param.where(System) where?: Where<System>,
  ): Promise<Count> {
    return this.systemRepository.updateAll(system, where);
  }

  @get('/systems/{id}', {
    responses: {
      '200': {
        description: 'System model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(System, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.string('id') id: number,
    @param.filter(System, {exclude: 'where'}) filter?: FilterExcludingWhere<System>
  ): Promise<System> {
    return this.systemRepository.findById(id, filter);
  }

  @patch('/systems/{id}', {
    responses: {
      '204': {
        description: 'System PATCH success',
      },
    },
  })
  async updateById(
    @param.path.string('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(System, {partial: true}),
        },
      },
    })
    system: System,
  ): Promise<void> {
    await this.systemRepository.updateById(id, system);
  }

  @put('/systems/{id}', {
    responses: {
      '204': {
        description: 'System PUT success',
      },
    },
  })
  async replaceById(
    @param.path.string('id') id: number,
    @requestBody() system: System,
  ): Promise<void> {
    await this.systemRepository.replaceById(id, system);
  }

  @del('/systems/{id}', {
    responses: {
      '204': {
        description: 'System DELETE success',
      },
    },
  })
  async deleteById(@param.path.string('id') id: number): Promise<void> {
    await this.systemRepository.deleteById(id);
  }

  @get('/system/currentUser', {
    responses: {
      '200': {
        description: 'get current logged in user',
        content: {
          'application/json': {
            schema: getModelSchemaRef(User, {includeRelations: true}),
          },
        },
      },
    },
  })
  async getCurrentUser(
  ): Promise<object> {
    const filter: FilterBuilder<System> = new FilterBuilder<System>({limit: 1});

    const res = await this.systemRepository.find(filter.filter);
    return res[0] ? (res[0].currentUser ? res[0].currentUser : {}) : {};
  }

}
