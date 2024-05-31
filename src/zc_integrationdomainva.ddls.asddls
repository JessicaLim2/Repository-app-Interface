@EndUserText.label: 'Integration domain value help of reposit'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_IntegrationDomainVa
  as projection on ZI_IntegrationDomainVa
{
  key IntegrationDom,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _IntegrationDomaiAll : redirected to parent ZC_IntegrationDomainVa_S
  
}
