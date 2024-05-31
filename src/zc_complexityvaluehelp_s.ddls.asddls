@EndUserText.label: 'Maintain Complexity value help of reposi'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ComplexityValueHelp_S
  provider contract transactional_query
  as projection on ZI_ComplexityValueHelp_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ComplexityValueHelp : redirected to composition child ZC_ComplexityValueHelp
  
}
