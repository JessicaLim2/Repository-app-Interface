@EndUserText.label: 'Mapping value help of repository app - M'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_MappingValueHelpOfR
  as projection on ZI_MappingValueHelpOfR
{
  key Mapping,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _MappingValueHelpAll : redirected to parent ZC_MappingValueHelpOfR_S
  
}
