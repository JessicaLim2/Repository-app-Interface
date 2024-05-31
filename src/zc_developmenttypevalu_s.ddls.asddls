@EndUserText.label: 'Development type value help of repositor'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_DevelopmentTypeValu_S
  provider contract transactional_query
  as projection on ZI_DevelopmentTypeValu_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _DevelopmentTypeValu : redirected to composition child ZC_DevelopmentTypeValu
  
}
