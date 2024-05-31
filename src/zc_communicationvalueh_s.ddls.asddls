@EndUserText.label: 'Communication value help of repository a'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_CommunicationValueH_S
  provider contract transactional_query
  as projection on ZI_CommunicationValueH_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _CommunicationValueH : redirected to composition child ZC_CommunicationValueH
  
}
