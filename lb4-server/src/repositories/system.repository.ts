import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {CloudantDataSource} from '../datasources';
import {System, SystemRelations} from '../models';

export class SystemRepository extends DefaultCrudRepository<
  System,
  typeof System.prototype.id,
  SystemRelations
  > {
  constructor(
    @inject('datasources.cloudant') dataSource: CloudantDataSource,
  ) {
    super(System, dataSource);
  }
}
