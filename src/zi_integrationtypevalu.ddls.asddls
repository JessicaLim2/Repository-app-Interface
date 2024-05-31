@EndUserText.label: 'Integration type value help of repositor'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_IntegrationTypeValu
  as select from ZDT_INTEGTYP_REP
  association to parent ZI_IntegrationTypeValu_S as _IntegrationTypeVAll on $projection.SingletonID = _IntegrationTypeVAll.SingletonID
{
  key INTEGRATION_TYPE as IntegrationType,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _IntegrationTypeVAll
  
}
