@EndUserText.label: 'Maintain Client project value help of re'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ClientProjectValueH_S
  provider contract transactional_query
  as projection on ZI_ClientProjectValueH_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ClientProjectValueH : redirected to composition child ZC_ClientProjectValueH
  
}
