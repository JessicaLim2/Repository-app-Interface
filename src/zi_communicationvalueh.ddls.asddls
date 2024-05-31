@EndUserText.label: 'Communication value help of repository a'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_CommunicationValueH
  as select from ZDT_COMM_REP
  association to parent ZI_CommunicationValueH_S as _CommunicationValAll on $projection.SingletonID = _CommunicationValAll.SingletonID
{
  key COMMUNICATION as Communication,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _CommunicationValAll
  
}
