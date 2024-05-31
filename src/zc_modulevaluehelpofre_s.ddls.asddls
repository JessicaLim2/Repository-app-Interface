@EndUserText.label: 'Module value help of repository app Sing'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ModuleValueHelpOfRe_S
  provider contract transactional_query
  as projection on ZI_ModuleValueHelpOfRe_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ModuleValueHelpOfRe : redirected to composition child ZC_ModuleValueHelpOfRe
  
}
