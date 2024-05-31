@EndUserText.label: 'System value help of repository app Sing'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_SystemValueHelpOfRe_S
  provider contract transactional_query
  as projection on ZI_SystemValueHelpOfRe_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _SystemValueHelpOfRe : redirected to composition child ZC_SystemValueHelpOfRe
  
}
