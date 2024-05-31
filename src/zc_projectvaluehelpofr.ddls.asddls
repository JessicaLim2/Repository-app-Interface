@EndUserText.label: 'Maintain Project value help of repositor'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ProjectValueHelpOfR
  as projection on ZI_ProjectValueHelpOfR
{
  key ClientPrj,
  key Project,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _ProjectValueHelpAll : redirected to parent ZC_ProjectValueHelpOfR_S
  
}
