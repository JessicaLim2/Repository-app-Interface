@EndUserText.label: 'Complexity value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ComplexityValueHelp
  as select from ZDT_COMPLEXITY
  association to parent ZI_ComplexityValueHelp_S as _ComplexityValueHAll on $projection.SingletonID = _ComplexityValueHAll.SingletonID
{
  key COMPLEXITY as Complexity,
  1 as SingletonID,
  _ComplexityValueHAll
  
}
