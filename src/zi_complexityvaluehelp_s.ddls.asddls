@EndUserText.label: 'Complexity value help of repository app'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ComplexityValueHelp_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_COMPLEXITYVALUEHELP'
  composition [0..*] of ZI_ComplexityValueHelp as _ComplexityValueHelp
{
  key 1 as SingletonID,
  _ComplexityValueHelp,
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
