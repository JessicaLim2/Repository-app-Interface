@EndUserText.label: 'Maintain Priority value help of reposito'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_PriorityValueHelpOf
  as projection on ZI_PriorityValueHelpOf
{
  key Priority,
  @Consumption.hidden: true
  SingletonID,
  _PriorityValueHelAll : redirected to parent ZC_PriorityValueHelpOf_S
  
}
