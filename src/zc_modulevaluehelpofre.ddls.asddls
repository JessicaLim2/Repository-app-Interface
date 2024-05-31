@EndUserText.label: 'Module value help of repository app - Ma'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ModuleValueHelpOfRe
  as projection on ZI_ModuleValueHelpOfRe
{
  key ModuleName,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _ModuleValueHelpOAll : redirected to parent ZC_ModuleValueHelpOfRe_S
  
}
