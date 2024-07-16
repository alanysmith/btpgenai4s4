using { alansmith_34_a42 as my } from '../db/schema.cds';

@path: '/service/alansmith_34_a42'
@requires: 'authenticated-user'
service alansmith_34_a42Srv {
  @odata.draft.enabled
  entity CustomerMessage as projection on my.CustomerMessage;
}