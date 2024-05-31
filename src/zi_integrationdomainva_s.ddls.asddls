@EndUserText.label: 'Integration domain value help of reposit'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_IntegrationDomainVa_S
  as select from I_Language
    left outer join ZDT_INTEGDOM_REP on 0 = 0
  composition [0..*] of ZI_IntegrationDomainVa as _IntegrationDomainVa
{
  key 1 as SingletonID,
  _IntegrationDomainVa,
  max( ZDT_INTEGDOM_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
