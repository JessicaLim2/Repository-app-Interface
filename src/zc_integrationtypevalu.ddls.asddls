@EndUserText.label: 'Integration type value help of repositor'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_IntegrationTypeValu
  as projection on ZI_IntegrationTypeValu
{
  key IntegrationType,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _IntegrationTypeVAll : redirected to parent ZC_IntegrationTypeValu_S
  
}
