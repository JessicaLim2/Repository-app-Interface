@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Integration pattern VH of repository app'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_INTEGRATION_PATT_VH as select from zdt_integpat_rep
{   
    @EndUserText.label: 'Integration Style'
    key integration_sty,
    @EndUserText.label: 'Integration Pattern'
    key integration_pat,
    @EndUserText.label: 'Integration Pattern Description'
    pattern_desc,
    @EndUserText.label: 'Integration Pattern Example'
    pattern_example
    
}
