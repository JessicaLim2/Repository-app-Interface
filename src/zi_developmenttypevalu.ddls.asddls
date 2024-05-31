@EndUserText.label: 'Development type value help of repositor'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_DevelopmentTypeValu
  as select from ZDT_DEVTYPE_REP
  association to parent ZI_DevelopmentTypeValu_S as _DevelopmentTypeVAll on $projection.SingletonID = _DevelopmentTypeVAll.SingletonID
{
  key DEV_TYPE as DevType,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _DevelopmentTypeVAll
  
}
