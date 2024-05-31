@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Integration type VH of repository app'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_INTEGRATION_TYPE_VH as select from zdt_integtyp_rep
{
    @EndUserText.label: 'Integration Type'
    key integration_type
}
