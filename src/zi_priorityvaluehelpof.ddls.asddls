@EndUserText.label: 'Priority value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_PriorityValueHelpOf
  as select from ZDT_PRIORITY
  association to parent ZI_PriorityValueHelpOf_S as _PriorityValueHelAll on $projection.SingletonID = _PriorityValueHelAll.SingletonID
{
  key PRIORITY as Priority,
  1 as SingletonID,
  _PriorityValueHelAll
  
}
