@EndUserText.label: 'Development type value help of repositor'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_DevelopmentTypeValu
  as projection on ZI_DevelopmentTypeValu
{
  key DevType,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _DevelopmentTypeVAll : redirected to parent ZC_DevelopmentTypeValu_S
  
}
