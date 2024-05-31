@EndUserText.label: 'Technical subarea value help of reposito'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_TechnicalSubareaVal_S
  as select from I_Language
    left outer join ZDT_TECH_SUBAREA on 0 = 0
  composition [0..*] of ZI_TechnicalSubareaVal as _TechnicalSubareaVal
{
  key 1 as SingletonID,
  _TechnicalSubareaVal,
  max( ZDT_TECH_SUBAREA.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
