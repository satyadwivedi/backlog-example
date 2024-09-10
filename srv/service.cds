using { interview as my } from '../db/schema.cds';

@path: '/service/interview'
@requires: 'authenticated-user'
service interviewSrv {
  @odata.draft.enabled
  entity Projects as projection on my.Projects;
  @odata.draft.enabled
  entity Category as projection on my.Category;

  

  action completeProject( projectId: UUID ) returns Projects;
}