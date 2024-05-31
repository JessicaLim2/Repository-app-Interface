@EndUserText.label: 'Projection view for repository'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: { typeName: 'Repository', typeNamePlural: 'Repository', 
         title: { type: #STANDARD } }
define root view entity ZC_REPOSITORY as projection on ZI_REPOSITORY
{
 //   @UI.facet: [ { id:      'Repository',
   //                purpose: #STANDARD,
     //              type:    #HEADERINFO_REFERENCE,
       //            label:   'Object View',
         //          position:10 },
           //      { id: 'Integration',
             //      purpose: #STANDARD,
               //    type:    #IDENTIFICATION_REFERENCE,
                 //  label:   'Integration',
                   //position:20,
                   //qualifier:'fg1'
                   //} ]
                   
     @UI.facet: [
         {
               label : 'Header',
               id : 'Repository',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 10
           },
           {
            //   label: 'Header',
               id : 'HeaderFG',
               purpose: #STANDARD,
               parentId : 'Repository',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'HeaderFG',
               position: 20
           },
           {
               label : 'Detail',
               id : 'IntegrationColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 20,
               hidden: #(UICT_INTEG_HIDE)
           },
           {
              // label: 'Detail',
               id : 'InterfaceFG',
               purpose: #STANDARD,
               parentId : 'IntegrationColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'InterfaceFG',
               position: 10
//               , hidden: #(UICT_INTEG_HIDE)
           },
           {
               label : 'Detail',
               id : 'FioriColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 30,
               hidden: #(UICT_FIORI_HIDE)
           },
           {
              // label: 'Fiori',
               id : 'FioriFG',
               purpose: #STANDARD,
               parentId : 'FioriColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'FioriFG',
               position: 10
           },
           {
               label : 'Detail',
               id : 'FormColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 40,
               hidden: #(UICT_FORM_HIDE)
           },
           {
             //  label: 'Form',
               id : 'FormFG',
               purpose: #STANDARD,
               parentId : 'FormColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'FormFG',
               position: 10
           },
           {
               label : 'Detail',
               id : 'ReportColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 40,
               hidden: #(UICT_REPORT_HIDE)
           },
           {
            //   label: 'Report',
               id : 'ReportFG',
               purpose: #STANDARD,
               parentId : 'ReportColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'ReportFG',
               position: 10
           },
           {
               label : 'Detail',
               id : 'EnhancementColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 40,
               hidden: #(UICT_ENHANCEMENT_HIDE)
           },
           {
            //   label: 'Report',
               id : 'EnhancementFG',
               purpose: #STANDARD,
               parentId : 'EnhancementColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'EnhancementFG',
               position: 10
           },
           {
               label : 'Detail',
               id : 'ConversionColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 40,
               hidden: #(UICT_CONVERSION_HIDE)
           },
           {
            //   label: 'Report',
               id : 'ConversionFG',
               purpose: #STANDARD,
               parentId : 'ConversionColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'ConversionFG',
               position: 10
           },
           {
               label : 'Detail',
               id : 'WorkflowColl',
               purpose: #STANDARD,
               type : #COLLECTION,
               position: 40,
               hidden: #(UICT_WORKFLOW_HIDE)
           },
           {
            //   label: 'Report',
               id : 'WorkflowFG',
               purpose: #STANDARD,
               parentId : 'WorkflowColl',
               type : #FIELDGROUP_REFERENCE,
               targetQualifier : 'WorkflowFG',
               position: 10
           }
           ]
           
 //   @UI.lineItem: [{ label: 'UUID' }]
   @EndUserText.label: 'UUID'
    key UUID,
    @UI: {  lineItem:   [ { position: 1 , label: 'Technical Area' }],
    fieldGroup: [{ position: 1, label:'Technical Area', qualifier: 'HeaderFG'}]}
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_DEVTYPE_VH', 
                                         element: 'dev_type' } }]
    key tech_area,
    @UI: {  lineItem:   [ { position: 2, label: 'Technical Subarea' } ],
            fieldGroup: [{ position: 2, label:'Technical Subarea', qualifier: 'HeaderFG'}]}
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_TECHSUBAREA_VH', 
                                         element: 'tech_subarea' } }]
 //   @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_TECH_VH', 
 //                                        element: 'technology' } }]
////    @Consumption.filter.hidden: true         only hide the field in main page adapt filters                         
    @EndUserText.label: 'Technical Subarea'
    
    tech_subarea,
    @UI: {  lineItem:   [ { position: 3 , label: 'Client' } ],
            fieldGroup: [{ position: 3, label:'Client', qualifier: 'HeaderFG'}],
            selectionField: [ { position: 1 }] }
    //from z_jl       
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_CLIENTPROJECT_VH', 
                                        element: 'client_proj' } }]
    @EndUserText.label: 'Client'        
    client_prj,
    @UI: {  lineItem:   [ { position: 10 , label: 'Project' } ],
            fieldGroup: [{ position: 10, label:'Project', qualifier: 'HeaderFG'}],
          selectionField: [ { position: 10 }] }
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_PROJECT_VH', element: 'project' },
    additionalBinding: [{ localElement: 'client_prj', element: 'client_prj' }]}]
    @EndUserText.label: 'Project'
    Project,
    @UI: {  lineItem:   [ { position: 20, label: 'RICEFW Description'  } ],
            fieldGroup: [{ position: 20, label:'RICEFW Description', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 20 }] }
    @EndUserText.label: 'RICEFW Description'
    ricefw_desc,
    @UI: {  lineItem:   [ { position: 30, label: 'RICEFW ID'  } ],
            fieldGroup: [{ position: 30, label:'RICEFW ID', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 30 }] }
    @EndUserText.label: 'RICEFW ID'
    ricefw_id,
    @UI: {  lineItem:   [ { position: 40, label: 'Module'  } ],
            fieldGroup: [{ position: 40, label:'Module', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 40 }] }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_MODULE_VH', 
                                         element: 'module_name' } }]
    @EndUserText.label: 'Module'
    module_name,
    @UI: {  lineItem:   [ { position: 50, label: 'Developer'  } ],
            fieldGroup: [{ position: 50, label:'Developer', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 50 }] }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_CONSULTANT_VH', 
                                         element: 'consultant' } }]
    @EndUserText.label: 'Developer'
    Developer,
    @UI: {  lineItem:   [ { position: 60, label: 'Functional'  } ],
            fieldGroup: [{ position: 60, label:'Functional', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 60 }] }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_CONSULTANT_VH', 
                                         element: 'consultant' } }]
    @EndUserText.label: 'Functional'
    Functional,
    NavSPURL,
    @UI: {  lineItem:       [ { position: 70, label: 'Sharepoint URL',
                                type: #WITH_URL, url: 'sharepoint_url'  } ],
            fieldGroup: [{ position: 70, label:'Sharepoint URL', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 70 }] }
    @EndUserText.label: 'Sharepoint URL'
    sharepoint_url,
    @UI: {  lineItem:       [ { position: 80, label: 'Reference'  } ],
            fieldGroup: [{ position: 80, label:'Reference', qualifier: 'HeaderFG' }],
            selectionField: [ { position: 80 }] }
    @EndUserText.label: 'Reference'
    reference,
    @UI: {  lineItem:   [ { position: 80, label: 'IFlow Name'  } ],
            fieldGroup: [{ position: 20, label:'IFlow', qualifier: 'InterfaceFG' }]
         }
    @EndUserText.label: 'IFlow Name'
    IFlow,
    @UI: {  lineItem:   [ { position: 90, label: 'Integration Domain'  } ],
            fieldGroup: [{ position: 30, label:'Integration Domain', qualifier: 'InterfaceFG' }]
         }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_INTEGRATION_DOM_VH', 
                                         element: 'integration_dom' } }]
    @EndUserText.label: 'Integration Domain'
    integration_dom,
    @UI: {  lineItem:   [ { position: 100, label: 'Integration Style'  } ],
            fieldGroup: [{ position: 40, label:'Integration Style', qualifier: 'InterfaceFG' }]
         }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_INTEGRATION_STY_VH', 
                                         element: 'integration_sty' } }]
    @EndUserText.label: 'Integration Style'
    integration_sty,
    @UI: {  lineItem:       [ { position: 110, label: 'Integration Use Case Pattern'  } ],
            fieldGroup: [{ position: 50, label:'Integration Pattern', qualifier: 'InterfaceFG' }]
         }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_INTEGRATION_PATT_VH', element: 'integration_pat' },
    additionalBinding: [{ localElement: 'integration_sty', element: 'integration_sty' }]}]
    @EndUserText.label: 'Integration Use Case Pattern'
    integration_pat,
    @UI: {  lineItem:       [ { position: 120, label: 'Sender System'  } ],
            fieldGroup: [{ position: 60, label:'Sender System', qualifier: 'InterfaceFG' }]
         }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_SYSTEM_VH', 
                                         element: 'syst' } }]
    @EndUserText.label: 'Sender System'
    Sender,
    @UI: {  lineItem:   [ { position: 130, label: 'Receiver System'  } ],
            fieldGroup: [{ position: 70, label:'Receiver System', qualifier: 'InterfaceFG' }]
          }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_SYSTEM_VH', 
                                         element: 'syst' } }]
    @EndUserText.label: 'Receiver System'
    Receiver,
    @UI: {  lineItem:       [ { position: 140, label: 'Interface Mode'  } ],
            fieldGroup: [{ position: 80, label:'Interface Mode', qualifier: 'InterfaceFG' }]
         }
    //from z_jl 
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_COMMUNICATION_VH', 
                                         element: 'communication' } }]
    @EndUserText.label: 'Interface Mode'
    Communication,
 //   @UI: {  lineItem:       [ { position: 120, label: 'Integration Technology'  } ],
 //           fieldGroup: [{ position: 90, label:'Technology', qualifier: 'Detail' }]
 //         }
 //   @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_TECH_VH', 
 //                                        element: 'technology' } }]
 //   @EndUserText.label: 'Integration Technology'
 //   Technology,
    @UI: {  lineItem:       [ { position: 150, label: 'Sender Data Format'  } ],
            fieldGroup: [{ position: 100, label:'Sender Data Format', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_DATAFORMAT_VH', 
                                         element: 'data_format' } }]
    @EndUserText.label: 'Sender Data Format'
    sender_format,
    @UI: {  lineItem:       [ { position: 160, label: 'Receiver Data Format'  } ],
            fieldGroup: [{ position: 110, label:'Receiver Data Format', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_DATAFORMAT_VH', 
                                         element: 'data_format' } }]
    @EndUserText.label: 'Receiver Data Format'
    receiver_format,
    @UI: {  lineItem:       [ { position: 170, label: 'Mapping'  } ],
            fieldGroup: [{ position: 120, label:'Mapping', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_MAPPING_VH', 
                                         element: 'mapping' } }]
    //@Consumption.filter.multipleSelections: true
    @EndUserText.label: 'Mapping'
    Mapping,
    @UI: {  lineItem:       [ { position: 180, label: 'Sender Security'  } ],
            fieldGroup: [{ position: 130, label:'Sender Security', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_SECURITY_VH', 
                                         element: 'security' } }]
    @EndUserText.label: 'Sender Security'
    sender_sec,
    @UI: {  lineItem:       [ { position: 190, label: 'Receiver Security'  } ],
            fieldGroup: [{ position: 140, label:'Receiver Security', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_SECURITY_VH', 
                                         element: 'security' } }]
    @EndUserText.label: 'Receiver Security'
    receiver_sec,
    @UI: {  lineItem:       [ { position: 200, label: 'Sender Integration Type'  } ],
            fieldGroup: [{ position: 150, label:'Sender Integration Type', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_INTEGRATION_TYPE_VH', 
                                         element: 'integration_type' } }]
    @EndUserText.label: 'Sender Integration Type'
    sender_type,
    @UI: {  lineItem:   [ { position: 210, label: 'Receiver Integration Type'  } ],
            fieldGroup: [{ position: 160, label:'Receiver Integration Type', qualifier: 'InterfaceFG' }]
         }
    //from z_jl
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZI_INTEGRATION_TYPE_VH', 
                                         element: 'integration_type' } }]
    @EndUserText.label: 'Receiver Integration Type'
    receiver_type,
    @UI: {  lineItem:   [ { position: 71, label: 'Multiple Variant'  } ],
            fieldGroup: [{ position: 190, label:'Multiple Variant', qualifier: 'InterfaceFG' }]
         }
    @EndUserText.label: 'Multiple Variant'
   // @Consumption.valueHelpDefinition: [{ entity:{name: 'ZDT_SUBAREA_INT', 
   //                                      element: 'tech_subarea' } }]
    multiple_variant,
    
    UICT_INTEG_HIDE,
    UICT_FIORI_HIDE,
    UICT_FORM_HIDE,
    UICT_REPORT_HIDE,
    UICT_ENHANCEMENT_HIDE,
    UICT_CONVERSION_HIDE,
    UICT_WORKFLOW_HIDE,
    @UI: {  fieldGroup: [{ position: 170, label:'Adapter', qualifier: 'InterfaceFG' }]}
    @EndUserText.label: 'Adapter'
    adapter,
    @UI: {  fieldGroup: [{ position: 180, label:'Function Module', qualifier: 'FormFG' }]}
    @EndUserText.label: 'Function Module'
    function_module,
    upload_flag,
////    @UI.lineItem: [{ position: 2, label: 'Draft To Active' ,type: #FOR_ACTION, dataAction: 'draftToActive'}]
 //   @UI.lineItem: [{ position: 2, label: 'draft To Active'}]
  
  //  @UI.lineItem: [{ position: 3, label: 'Create/Delete' ,type: #FOR_INTENT_BASED_NAVIGATION, 
  //  semanticObject: 'zinterface_repository', semanticObjectAction:'maintain'}]
    statcode,
    locallastchangedat,
    @UI: {  lineItem:       [ { position: 240, label: 'Report Name'  } ],
            fieldGroup: [{ position: 10, label:'Report Name', qualifier: 'ReportFG' }]}
    @EndUserText.label: 'Report Name'
    report_name,
    @UI: {  lineItem:       [ { position: 250, label: 'UI Repository'  } ],
            fieldGroup: [{ position: 10, label:'UI Repository', qualifier: 'FioriFG' }]}
    @EndUserText.label: 'UI Repository'
    ui_repository,
    @UI: {  lineItem:       [ { position: 260, label: 'Enhancement Name'  } ],
            fieldGroup: [{ position: 10, label:'Enhancement Name', qualifier: 'EnhancementFG' }]}
    @EndUserText.label: 'Enhancement Name'
    enhancement_name,
 //   @UI: {  lineItem:       [ { position: 270, label: 'File Format'  } ],
 //           fieldGroup: [{ position: 10, label:'File Format', qualifier: 'ConversionFG' }]}
 //   @EndUserText.label: 'File Format'
 //   file_format,
    @UI: {  lineItem:       [ { position: 270, label: 'ABAP Project' } ],
            fieldGroup: [{ position: 10, label:'ABAP Project', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'ABAP Project'
    abap_prog,
    @UI: {  lineItem:       [ { position: 160, label: 'LSMW Project' } ],
            fieldGroup: [{ position: 20, label:'LSMW Project', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'LSMW Project'
    lsmw_proj,
    @UI: {  lineItem:       [ { position: 170, label: 'LSMW Subproject' } ],
            fieldGroup: [{ position: 30, label:'ABAP Project', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'LSMW Subproject'
    lsmw_subproj,
    @UI: {  lineItem:       [ { position: 180, label: 'LSMW Object' } ],
            fieldGroup: [{ position: 40, label:'LSMW Object', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'LSMW Object'
    lsmw_obj,
    @UI: {  lineItem:       [ { position: 190, label: 'LTMC Migration Project' } ],
            fieldGroup: [{ position: 50, label:'LTMC Migration Project', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'LTMC Migration Project'
    ltmc_mig,
    @UI: {  lineItem:       [ { position: 200, label: 'BODS Project' } ],
            fieldGroup: [{ position: 60, label:'BODS Project', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'BODS Project'
    bods_proj,
    @UI: {  lineItem:       [ { position: 210, label: 'File Type' } ],
            fieldGroup: [{ position: 70, label:'File Type', qualifier: 'ConversionFG' }]}
    @EndUserText.label: 'File Type'
    file_type,
    
   // @UI: {  lineItem:       [ { position: 280, label: 'Workflow'  } ],
   //         fieldGroup: [{ position: 10, label:'Workflow', qualifier: 'WorkflowFG' }]}
   // @EndUserText.label: 'Workflow'
   // workflow,
    @UI: {  lineItem:       [ { position: 220, label: 'Workflow Template'  } ],
            fieldGroup: [{ position: 10, label:'Workflow Template', qualifier: 'WorkflowFG' }]}
    @EndUserText.label: 'Workflow Template'
    workflow_temp,
    @UI: {  lineItem:       [ { position: 230, label: 'SAP Build Project Name'  } ],
            fieldGroup: [{ position: 20, label:'SAP Build Project Name', qualifier: 'WorkflowFG' }]}
    @EndUserText.label: 'SAP Build Project Name'
    sap_build_proj,
    @UI: {  lineItem:       [ { position: 240, label: 'File Type (If Applicable)'  } ],
            fieldGroup: [{ position: 30, label:'File Type (If Applicable)', qualifier: 'WorkflowFG' }]}
    @EndUserText.label: 'File Type (If Applicable)'
    workflow_file_type,
    @UI: {  lineItem:       [ { position: 250, label: 'Method Used'  } ],
            fieldGroup: [{ position: 40, label:'Method Used', qualifier: 'WorkflowFG' }]}
    @EndUserText.label: 'Method Used'
    method,
   
    @UI: {  lineItem:       [ { position: 260, label: 'Form Name'  } ],
            fieldGroup: [{ position: 10, label:'Form', qualifier: 'FormFG' }]}
    @EndUserText.label: 'Form Name'
    form_name,
    @UI: {  lineItem:       [ { position: 300, label: 'Print Program Name'  } ],
            fieldGroup: [{ position: 10, label:'Form', qualifier: 'FormFG' }]}
    @EndUserText.label: 'Print Program Name'
    print_prog
    
}

