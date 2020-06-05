import {DefaultCrudRepository} from '@loopback/repository';
import {Problem, ProblemRelations} from '../models';
import {CloudantDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ProblemRepository extends DefaultCrudRepository<
  Problem,
  typeof Problem.prototype.id,
  ProblemRelations
> {
  constructor(
    @inject('datasources.Cloudant-cfc-2020') dataSource: CloudantDataSource,
  ) {
    super(Problem, dataSource);
  }
}
