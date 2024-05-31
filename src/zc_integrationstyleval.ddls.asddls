@EndUserText.label: 'Integration style value help of reposito'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_IntegrationStyleVal
  as projection on ZI_IntegrationStyleVal
{
  key IntegrationSty,
  StyleDesc,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _IntegrationStyleAll : redirected to parent ZC_IntegrationStyleVal_S
  
}
