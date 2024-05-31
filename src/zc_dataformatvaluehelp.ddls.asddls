@EndUserText.label: 'Data format value help of repository app'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_DataFormatValueHelp
  as projection on ZI_DataFormatValueHelp
{
  key DataFormat,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _DataFormatValueHAll : redirected to parent ZC_DataFormatValueHelp_S
  
}
