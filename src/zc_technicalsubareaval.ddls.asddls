@EndUserText.label: 'Maintain Technical subarea value help of'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_TechnicalSubareaVal
  as projection on ZI_TechnicalSubareaVal
{
  key TechArea,
  key TechSubarea,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _TechnicalSubareaAll : redirected to parent ZC_TechnicalSubareaVal_S
  
}
