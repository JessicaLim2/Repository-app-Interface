@EndUserText.label: 'Integration technology value help of rep'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_IntegrationTechnolo_S
  provider contract transactional_query
  as projection on ZI_IntegrationTechnolo_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _IntegrationTechnolo : redirected to composition child ZC_IntegrationTechnolo
  
}
