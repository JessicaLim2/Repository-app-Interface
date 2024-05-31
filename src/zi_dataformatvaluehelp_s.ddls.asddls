@EndUserText.label: 'Data format value help of repository app'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_DataFormatValueHelp_S
  as select from I_Language
    left outer join ZDT_DATAFORM_REP on 0 = 0
  composition [0..*] of ZI_DataFormatValueHelp as _DataFormatValueHelp
{
  key 1 as SingletonID,
  _DataFormatValueHelp,
  max( ZDT_DATAFORM_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
