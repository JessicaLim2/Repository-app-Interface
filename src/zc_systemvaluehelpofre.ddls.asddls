@EndUserText.label: 'System value help of repository app - Ma'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_SystemValueHelpOfRe
  as projection on ZI_SystemValueHelpOfRe
{
  key Syst,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _SystemValueHelpOAll : redirected to parent ZC_SystemValueHelpOfRe_S
  
}
