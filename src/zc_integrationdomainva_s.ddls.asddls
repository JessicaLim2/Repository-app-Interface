@EndUserText.label: 'Integration domain value help of reposit'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_IntegrationDomainVa_S
  provider contract transactional_query
  as projection on ZI_IntegrationDomainVa_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _IntegrationDomainVa : redirected to composition child ZC_IntegrationDomainVa
  
}
