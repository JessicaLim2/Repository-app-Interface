@EndUserText.label: 'Project value help of repository app Sin'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ProjectValueHelpOfR_S
  as select from I_Language
    left outer join ZDT_PROJECT_REP on 0 = 0
  composition [0..*] of ZI_ProjectValueHelpOfR as _ProjectValueHelpOfR
{
  key 1 as SingletonID,
  _ProjectValueHelpOfR,
  max( ZDT_PROJECT_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
