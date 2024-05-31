@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dara model of repository'                 
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_REPOSITORY as select from ZI_REPOSITORY_UNION
//zdt_repository
{
    key UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    Interface,
    multiple_variant,
    IFlow,
    integration_dom,
    integration_sty,
    integration_pat,
    Sender,
    Receiver,
    Communication,
    Technology,
    sender_format,
    receiver_format,
    Mapping,
    sender_sec,
    receiver_sec,
    sender_type,
    receiver_type,
    adapter,
    function_module,
    module_name,
    priority,
    complexity,
    estimated_manday,
    approved_manday,
    Developer,
    Functional,
    sharepoint_url,
    reference,
    NavSPURL,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_pipo_hide,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_cpi_hide,
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_rfc_hide,
    report_name,//10
    ui_repository,
    enhancement_name,
    form_name,
    print_prog,
    //file_format,
    abap_prog,
    lsmw_proj,
    lsmw_subproj,
    lsmw_obj,
    ltmc_mig,
    bods_proj,
    file_type,
    //workflow,
    workflow_temp,
    sap_build_proj,
    workflow_file_type,
    method,
    upload_flag,
    statcode,
    locallastchangedat,
    
 //   key uuid as UUID, // Make association public
 //   dev_type,
 //   client_prj,
 //   project as Project,
 //   ricefw_desc,
 //   ricefw_id,
 //   interface as Interface,
 //   iflow as IFlow,
 //   integration_dom,
 //   integration_sty,
 //   integration_pat,
 //   sender as Sender,
 //   receiver as Receiver,
 //   communication as Communication,
 //   technology as Technology,
 //   sender_format,
 //   receiver_format,
 //   mapping as Mapping,
 //   sender_sec,
 //   receiver_sec,
 //   sender_type,
 //   receiver_type,
 //   module_name,
 //   developer as Developer,
 //   functional as Functional,
 //   sharepoint_url,
 //   concat('javascript:window.open(sharepoint_url)','') as NavSPURL,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_INTEG_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_FIORI_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_FORM_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_REPORT_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_ENHANCEMENT_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_CONVERSION_HIDE,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
    cast('' as abap.char(1)) as UICT_WORKFLOW_HIDE
 //     uict_integ_hide,
 //     uict_fiori_hide,
 //     uict_form_hide
 //   odata,
 //   bsp_app,
 //   tile_name,
 //   form_type,
 //   upload_flag,
 //   statcode,
 //   locallastchangedat
}
