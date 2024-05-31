@EndUserText.label: 'Security value help of repository app Si'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_SecurityValueHelpOf_S
  as select from I_Language
    left outer join ZDT_SECURITY_REP on 0 = 0
  composition [0..*] of ZI_SecurityValueHelpOf as _SecurityValueHelpOf
{
  key 1 as SingletonID,
  _SecurityValueHelpOf,
  max( ZDT_SECURITY_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
