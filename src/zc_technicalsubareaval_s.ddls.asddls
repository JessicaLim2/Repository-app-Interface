@EndUserText.label: 'Maintain Technical subarea value help of'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_TechnicalSubareaVal_S
  provider contract transactional_query
  as projection on ZI_TechnicalSubareaVal_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _TechnicalSubareaVal : redirected to composition child ZC_TechnicalSubareaVal
  
}
