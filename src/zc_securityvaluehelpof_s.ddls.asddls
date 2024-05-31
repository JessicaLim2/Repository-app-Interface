@EndUserText.label: 'Security value help of repository app Si'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_SecurityValueHelpOf_S
  provider contract transactional_query
  as projection on ZI_SecurityValueHelpOf_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _SecurityValueHelpOf : redirected to composition child ZC_SecurityValueHelpOf
  
}
