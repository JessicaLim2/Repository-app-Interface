@EndUserText.label: 'Integration technology value help of rep'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_IntegrationTechnolo
  as projection on ZI_IntegrationTechnolo
{
  key Technology,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _IntegrationTechnAll : redirected to parent ZC_IntegrationTechnolo_S
  
}
