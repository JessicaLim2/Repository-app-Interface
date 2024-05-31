@EndUserText.label: 'Project value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ProjectValueHelpOfR
  as select from ZDT_PROJECT_REP
  association to parent ZI_ProjectValueHelpOfR_S as _ProjectValueHelpAll on $projection.SingletonID = _ProjectValueHelpAll.SingletonID
{
  key CLIENT_PRJ as ClientPrj,
  key PROJECT as Project,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ProjectValueHelpAll
  
}
