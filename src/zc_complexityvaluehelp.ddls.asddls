@EndUserText.label: 'Maintain Complexity value help of reposi'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ComplexityValueHelp
  as projection on ZI_ComplexityValueHelp
{
  key Complexity,
  @Consumption.hidden: true
  SingletonID,
  _ComplexityValueHAll : redirected to parent ZC_ComplexityValueHelp_S
  
}
