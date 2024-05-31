@EndUserText.label: 'Maintain Consultant value help of reposi'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ConsultantValueHelp_S
  provider contract transactional_query
  as projection on ZI_ConsultantValueHelp_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ConsultantValueHelp : redirected to composition child ZC_ConsultantValueHelp
  
}
