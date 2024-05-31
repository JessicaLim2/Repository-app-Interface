@EndUserText.label: 'Communication value help of repository a'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_CommunicationValueH
  as projection on ZI_CommunicationValueH
{
  key Communication,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _CommunicationValAll : redirected to parent ZC_CommunicationValueH_S
  
}
