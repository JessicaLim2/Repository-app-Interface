@EndUserText.label: 'Priority value help of repository app Si'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_PriorityValueHelpOf_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_PRIORITYVALUEHELPOF'
  composition [0..*] of ZI_PriorityValueHelpOf as _PriorityValueHelpOf
{
  key 1 as SingletonID,
  _PriorityValueHelpOf,
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
