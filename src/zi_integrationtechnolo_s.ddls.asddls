@EndUserText.label: 'Integration technology value help of rep'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_IntegrationTechnolo_S
  as select from I_Language
    left outer join ZDT_TECH_REP on 0 = 0
  composition [0..*] of ZI_IntegrationTechnolo as _IntegrationTechnolo
{
  key 1 as SingletonID,
  _IntegrationTechnolo,
  max( ZDT_TECH_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
