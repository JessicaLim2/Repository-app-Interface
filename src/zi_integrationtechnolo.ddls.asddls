@EndUserText.label: 'Integration technology value help of rep'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_IntegrationTechnolo
  as select from ZDT_TECH_REP
  association to parent ZI_IntegrationTechnolo_S as _IntegrationTechnAll on $projection.SingletonID = _IntegrationTechnAll.SingletonID
{
  key TECHNOLOGY as Technology,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _IntegrationTechnAll
  
}
