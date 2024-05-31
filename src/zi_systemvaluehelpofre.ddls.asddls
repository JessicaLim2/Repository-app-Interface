@EndUserText.label: 'System value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_SystemValueHelpOfRe
  as select from ZDT_SYSTEM_REP
  association to parent ZI_SystemValueHelpOfRe_S as _SystemValueHelpOAll on $projection.SingletonID = _SystemValueHelpOAll.SingletonID
{
  key SYST as Syst,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _SystemValueHelpOAll
  
}
