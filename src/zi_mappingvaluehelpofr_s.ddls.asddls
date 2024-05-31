@EndUserText.label: 'Mapping value help of repository app Sin'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_MappingValueHelpOfR_S
  as select from I_Language
    left outer join ZDT_MAPPING_REP on 0 = 0
  composition [0..*] of ZI_MappingValueHelpOfR as _MappingValueHelpOfR
{
  key 1 as SingletonID,
  _MappingValueHelpOfR,
  max( ZDT_MAPPING_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
