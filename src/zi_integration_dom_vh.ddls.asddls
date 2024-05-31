@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Integration domain VH of repository app'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZI_INTEGRATION_DOM_VH as select from zdt_integdom_rep
{
    key integration_dom
}
