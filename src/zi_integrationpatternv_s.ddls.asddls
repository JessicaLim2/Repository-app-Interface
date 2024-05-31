@EndUserText.label: 'Integration pattern value help of reposi'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_IntegrationPatternV_S
  as select from I_Language
    left outer join ZDT_INTEGPAT_REP on 0 = 0
  composition [0..*] of ZI_IntegrationPatternV as _IntegrationPatternV
{
  key 1 as SingletonID,
  _IntegrationPatternV,
  max( ZDT_INTEGPAT_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
