@EndUserText.label: 'Module value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ModuleValueHelpOfRe
  as select from ZDT_MODULE_REP
  association to parent ZI_ModuleValueHelpOfRe_S as _ModuleValueHelpOAll on $projection.SingletonID = _ModuleValueHelpOAll.SingletonID
{
  key MODULE_NAME as ModuleName,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ModuleValueHelpOAll
  
}
