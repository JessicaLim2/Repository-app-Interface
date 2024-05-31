@EndUserText.label: 'Communication value help of repository a'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_CommunicationValueH_S
  as select from I_Language
    left outer join ZDT_COMM_REP on 0 = 0
  composition [0..*] of ZI_CommunicationValueH as _CommunicationValueH
{
  key 1 as SingletonID,
  _CommunicationValueH,
  max( ZDT_COMM_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
