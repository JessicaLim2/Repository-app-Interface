@EndUserText.label: 'Consultant value help of repository app'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ConsultantValueHelp_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_CONSULTANTVALUEHELP'
  composition [0..*] of ZI_ConsultantValueHelp as _ConsultantValueHelp
{
  key 1 as SingletonID,
  _ConsultantValueHelp,
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
