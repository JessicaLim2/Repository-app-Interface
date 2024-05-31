@EndUserText.label: 'Module value help of repository app Sing'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ModuleValueHelpOfRe_S
  as select from I_Language
    left outer join ZDT_MODULE_REP on 0 = 0
  composition [0..*] of ZI_ModuleValueHelpOfRe as _ModuleValueHelpOfRe
{
  key 1 as SingletonID,
  _ModuleValueHelpOfRe,
  max( ZDT_MODULE_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
