@EndUserText.label: 'System value help of repository app Sing'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_SystemValueHelpOfRe_S
  as select from I_Language
    left outer join ZDT_SYSTEM_REP on 0 = 0
  composition [0..*] of ZI_SystemValueHelpOfRe as _SystemValueHelpOfRe
{
  key 1 as SingletonID,
  _SystemValueHelpOfRe,
  max( ZDT_SYSTEM_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
