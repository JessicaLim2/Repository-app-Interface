@EndUserText.label: 'Client project value help of repository'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ClientProjectValueH
  as select from ZDT_CLIENTPJ_REP
  association to parent ZI_ClientProjectValueH_S as _ClientProjectValAll on $projection.SingletonID = _ClientProjectValAll.SingletonID
{
  key CLIENT_PROJ as ClientProj,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ClientProjectValAll
  
}
