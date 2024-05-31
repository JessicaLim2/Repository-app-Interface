@EndUserText.label: 'Integration pattern value help of reposi'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_IntegrationPatternV_S
  provider contract transactional_query
  as projection on ZI_IntegrationPatternV_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _IntegrationPatternV : redirected to composition child ZC_IntegrationPatternV
  
}
