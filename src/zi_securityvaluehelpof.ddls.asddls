@EndUserText.label: 'Security value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_SecurityValueHelpOf
  as select from ZDT_SECURITY_REP
  association to parent ZI_SecurityValueHelpOf_S as _SecurityValueHelAll on $projection.SingletonID = _SecurityValueHelAll.SingletonID
{
  key SECURITY as Security,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _SecurityValueHelAll
  
}
