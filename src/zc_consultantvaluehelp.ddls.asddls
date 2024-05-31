@EndUserText.label: 'Maintain Consultant value help of reposi'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ConsultantValueHelp
  as projection on ZI_ConsultantValueHelp
{
  key Consultant,
  @Consumption.hidden: true
  SingletonID,
  _ConsultantValueHAll : redirected to parent ZC_ConsultantValueHelp_S
  
}
