@EndUserText.label: 'Mapping value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_MappingValueHelpOfR
  as select from ZDT_MAPPING_REP
  association to parent ZI_MappingValueHelpOfR_S as _MappingValueHelpAll on $projection.SingletonID = _MappingValueHelpAll.SingletonID
{
  key MAPPING as Mapping,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _MappingValueHelpAll
  
}
