@EndUserText.label: 'Data format value help of repository app'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_DataFormatValueHelp
  as select from ZDT_DATAFORM_REP
  association to parent ZI_DataFormatValueHelp_S as _DataFormatValueHAll on $projection.SingletonID = _DataFormatValueHAll.SingletonID
{
  key DATA_FORMAT as DataFormat,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _DataFormatValueHAll
  
}
