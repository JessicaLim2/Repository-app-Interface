@EndUserText.label: 'Security value help of repository app - '
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_SecurityValueHelpOf
  as projection on ZI_SecurityValueHelpOf
{
  key Security,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _SecurityValueHelAll : redirected to parent ZC_SecurityValueHelpOf_S
  
}
