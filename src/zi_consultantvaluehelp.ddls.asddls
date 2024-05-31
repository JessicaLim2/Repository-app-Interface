@EndUserText.label: 'Consultant value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ConsultantValueHelp
  as select from ZDT_CONSULTANT
  association to parent ZI_ConsultantValueHelp_S as _ConsultantValueHAll on $projection.SingletonID = _ConsultantValueHAll.SingletonID
{
  key CONSULTANT as Consultant,
  1 as SingletonID,
  _ConsultantValueHAll
  
}
