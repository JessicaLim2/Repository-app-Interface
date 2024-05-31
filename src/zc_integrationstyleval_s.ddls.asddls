@EndUserText.label: 'Integration style value help of reposito'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_IntegrationStyleVal_S
  provider contract transactional_query
  as projection on ZI_IntegrationStyleVal_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _IntegrationStyleVal : redirected to composition child ZC_IntegrationStyleVal
  
}
