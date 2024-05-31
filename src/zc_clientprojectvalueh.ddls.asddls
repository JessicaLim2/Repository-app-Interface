@EndUserText.label: 'Maintain Client project value help of re'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ClientProjectValueH
  as projection on ZI_ClientProjectValueH
{
  key ClientProj,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _ClientProjectValAll : redirected to parent ZC_ClientProjectValueH_S
  
}
