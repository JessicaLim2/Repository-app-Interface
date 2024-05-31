@EndUserText.label: 'Technical subarea value help of reposito'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_TechnicalSubareaVal
  as select from ZDT_TECH_SUBAREA
  association to parent ZI_TechnicalSubareaVal_S as _TechnicalSubareaAll on $projection.SingletonID = _TechnicalSubareaAll.SingletonID
{
  key TECH_AREA as TechArea,
  key TECH_SUBAREA as TechSubarea,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _TechnicalSubareaAll
  
}
