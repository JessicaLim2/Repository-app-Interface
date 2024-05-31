@EndUserText.label: 'Client project value help of repository'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ClientProjectValueH_S
  as select from I_Language
    left outer join ZDT_CLIENTPJ_REP on 0 = 0
  composition [0..*] of ZI_ClientProjectValueH as _ClientProjectValueH
{
  key 1 as SingletonID,
  _ClientProjectValueH,
  max( ZDT_CLIENTPJ_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
