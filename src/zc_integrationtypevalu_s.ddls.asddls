@EndUserText.label: 'Integration type value help of repositor'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_IntegrationTypeValu_S
  provider contract transactional_query
  as projection on ZI_IntegrationTypeValu_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _IntegrationTypeValu : redirected to composition child ZC_IntegrationTypeValu
  
}
