@EndUserText.label: 'Integration pattern value help of reposi'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_IntegrationPatternV
  as select from ZDT_INTEGPAT_REP
  association to parent ZI_IntegrationPatternV_S as _IntegrationPatteAll on $projection.SingletonID = _IntegrationPatteAll.SingletonID
{
  key INTEGRATION_STY as IntegrationSty,
  key INTEGRATION_PAT as IntegrationPat,
  PATTERN_DESC as PatternDesc,
  PATTERN_EXAMPLE as PatternExample,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _IntegrationPatteAll
  
}
