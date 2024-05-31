@EndUserText.label: 'Integration pattern value help of reposi'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_IntegrationPatternV
  as projection on ZI_IntegrationPatternV
{
  key IntegrationSty,
  key IntegrationPat,
  PatternDesc,
  PatternExample,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _IntegrationPatteAll : redirected to parent ZC_IntegrationPatternV_S
  
}
