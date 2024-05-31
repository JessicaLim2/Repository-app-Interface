@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union interface view of repository app'                 
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_REPOSITORY_UNION as select from ZI_INTERFACE
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
    cast('' as abap.char(8)) as priority,
    cast('' as abap.char(12)) as complexity,
    cast('' as abap.char(3)) as estimated_manday,
    cast('' as abap.char(3)) as approved_manday,
    Developer,
    Functional,
    sharepoint_url,
    reference,
    NavSPURL,
    cast('' as abap.char(100)) as report_name,//10
    cast('' as abap.char(200)) as ui_repository,
    cast('' as abap.char(50)) as enhancement_name,
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    
    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    upload_flag,
    statcode,
    locallastchangedat
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
 //   cast('' as abap.char(1)) as uict_integ_hide,
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
 //   cast('' as abap.char(1)) as uict_fiori_hide,
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
 //   cast('' as abap.char(1)) as uict_form_hide
 
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
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
 //   cast('' as abap.char(1)) as uict_integ_hide,
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
 //   cast('' as abap.char(1)) as uict_fiori_hide,
 //   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTEG_HIDE'
 //   cast('' as abap.char(1)) as uict_form_hide,
 //   odata,
 //   bsp_app,
 //   tile_name,
 //   form_type,
 //   upload_flag,
 //   statcode,
 //   locallastchangedat
}union all select from ZI_REPORT{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
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
    report_name,
    cast('' as abap.char(200)) as ui_repository,
    cast('' as abap.char(50)) as enhancement_name,
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    
    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
   // @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_integ_hide,
   // @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_fiori_hide,
   // @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_INTERFACE_HIDE'
//    cast('' as abap.char(1)) as uict_form_hide
    
}union all select from ZI_FIORI{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
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
    cast('' as abap.char(100)) as report_name,
    ui_repository,
    cast('' as abap.char(50)) as enhancement_name,
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    
    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
}union all select from ZI_ENHANCEMENT{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
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
    cast('' as abap.char(100)) as report_name,
    cast('' as abap.char(200)) as ui_repository,
    enhancement_name,//different fm column so cannot use line 213
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    
    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
}union all select from ZI_CONVERSION{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
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
    cast('' as abap.char(100)) as report_name,
    cast('' as abap.char(200)) as ui_repository,
    cast('' as abap.char(50)) as enhancement_name,//different fm column so cannot use line 213
    abap_prog,
    lsmw_proj,
    lsmw_subproj,
    lsmw_obj,
    ltmc_mig,
    bods_proj,
    file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    
    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
}union all select from ZI_WORKFLOW{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
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
    cast('' as abap.char(100)) as report_name,
    cast('' as abap.char(200)) as ui_repository,
    cast('' as abap.char(50)) as enhancement_name,//different fm column so cannot use line 213
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //workflow,
    workflow_temp,
    sap_build_proj,
    workflow_file_type,
    method,

    cast('' as abap.char(100)) as form_name,
    cast('' as abap.char(50)) as print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
}union all select from ZI_FORM{
    key UUID as UUID, // Make association public
    key tech_area,
    tech_subarea,
    client_prj,
    Project,
    ricefw_desc,
    ricefw_id,
    cast('' as abap.char(100)) as interface,
    cast('' as abap_boolean) as multiple_variant,
    cast('' as abap.char(100)) as IFlow,
    cast('' as abap.char(20)) as integration_dom,
    cast('' as abap.char(30)) as integration_sty,
    cast('' as abap.char(30)) as integration_pat,
    cast('' as abap.char(55)) as Sender,
    cast('' as abap.char(55)) as Receiver,
    cast('' as abap.char(20)) as Communication,
    cast('' as abap.char(90)) as Technology,
    cast('' as abap.char(20)) as sender_format,
    cast('' as abap.char(20)) as receiver_format,
    cast('' as abap.char(30)) as Mapping,
    cast('' as abap.char(20)) as sender_sec,
    cast('' as abap.char(20)) as receiver_sec,
    cast('' as abap.char(20)) as sender_type,
    cast('' as abap.char(20)) as receiver_type,
    cast('' as abap.char(20)) as adapter,
    cast('' as abap.char(20)) as function_module,
    
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
    cast('' as abap.char(100)) as report_name,
    cast('' as abap.char(200)) as ui_repository,
    cast('' as abap.char(50)) as enhancement_name,//different fm column so cannot use line 213
    //cast('' as abap.char(10)) as file_format,
    cast('' as abap.char(40)) as abap_prog,
    cast('' as abap.char(40)) as lsmw_proj,
    cast('' as abap.char(40)) as lsmw_subproj,
    cast('' as abap.char(40)) as lsmw_obj,
    cast('' as abap.char(40)) as ltmc_mig,
    cast('' as abap.char(40)) as bods_proj,
    cast('' as abap.char(10)) as file_type,
    //cast('' as abap.char(13)) as workflow,
    cast('' as abap.char(13)) as workflow_temp,
    cast('' as abap.char(40)) as sap_build_proj,
    cast('' as abap.char(30)) as workflow_file_type,
    cast('' as abap.char(20)) as method,
    form_name,
    print_prog,
    
    upload_flag,
    statcode,
    locallastchangedat
}





