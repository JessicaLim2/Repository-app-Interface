@EndUserText.label: 'Mapping value help of repository app Sin'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_MappingValueHelpOfR_S
  provider contract transactional_query
  as projection on ZI_MappingValueHelpOfR_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _MappingValueHelpOfR : redirected to composition child ZC_MappingValueHelpOfR
  
}
