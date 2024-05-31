@EndUserText.label: 'Integration style value help of reposito'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_IntegrationStyleVal
  as select from ZDT_INTEGSTY_REP
  association to parent ZI_IntegrationStyleVal_S as _IntegrationStyleAll on $projection.SingletonID = _IntegrationStyleAll.SingletonID
{
  key INTEGRATION_STY as IntegrationSty,
  STYLE_DESC as StyleDesc,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _IntegrationStyleAll
  
}
