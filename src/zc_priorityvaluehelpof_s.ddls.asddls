@EndUserText.label: 'Maintain Priority value help of reposito'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_PriorityValueHelpOf_S
  provider contract transactional_query
  as projection on ZI_PriorityValueHelpOf_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _PriorityValueHelpOf : redirected to composition child ZC_PriorityValueHelpOf
  
}
