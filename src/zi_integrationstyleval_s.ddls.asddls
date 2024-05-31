@EndUserText.label: 'Integration style value help of reposito'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_IntegrationStyleVal_S
  as select from I_Language
    left outer join ZDT_INTEGSTY_REP on 0 = 0
  composition [0..*] of ZI_IntegrationStyleVal as _IntegrationStyleVal
{
  key 1 as SingletonID,
  _IntegrationStyleVal,
  max( ZDT_INTEGSTY_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
