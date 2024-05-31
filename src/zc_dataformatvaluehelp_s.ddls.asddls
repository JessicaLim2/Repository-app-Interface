@EndUserText.label: 'Data format value help of repository app'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_DataFormatValueHelp_S
  provider contract transactional_query
  as projection on ZI_DataFormatValueHelp_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _DataFormatValueHelp : redirected to composition child ZC_DataFormatValueHelp
  
}
