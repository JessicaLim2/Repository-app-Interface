@EndUserText.label: 'Maintain Project value help of repositor'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ProjectValueHelpOfR_S
  provider contract transactional_query
  as projection on ZI_ProjectValueHelpOfR_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ProjectValueHelpOfR : redirected to composition child ZC_ProjectValueHelpOfR
  
}
