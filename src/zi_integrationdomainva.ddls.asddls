@EndUserText.label: 'Integration domain value help of reposit'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_IntegrationDomainVa
  as select from ZDT_INTEGDOM_REP
  association to parent ZI_IntegrationDomainVa_S as _IntegrationDomaiAll on $projection.SingletonID = _IntegrationDomaiAll.SingletonID
{
  key INTEGRATION_DOM as IntegrationDom,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _IntegrationDomaiAll
  
}
