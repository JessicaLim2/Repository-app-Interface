@EndUserText.label: 'Development type value help of repositor'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_DevelopmentTypeValu_S
  as select from I_Language
    left outer join ZDT_DEVTYPE_REP on 0 = 0
  composition [0..*] of ZI_DevelopmentTypeValu as _DevelopmentTypeValu
{
  key 1 as SingletonID,
  _DevelopmentTypeValu,
  max( ZDT_DEVTYPE_REP.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
