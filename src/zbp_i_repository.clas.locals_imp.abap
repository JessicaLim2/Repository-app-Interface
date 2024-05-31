CLASS lhc_ZI_REPOSITORY DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_repository RESULT result.
*   METHODS validatedevtype FOR VALIDATE ON SAVE
*      IMPORTING keys FOR zi_repository~validatedevtype.
    METHODS validateproject FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validateproject.
    METHODS validateclientproj FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validateclientproj.
    METHODS validateintdomain FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validateintdomain.
    METHODS validateintstyle FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validateintstyle.
    METHODS validateintpattern FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validateintpattern.
    METHODS validatecommunication FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatecommunication.
    METHODS validatetechnology FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatetechnology.
    METHODS validatesenderformat FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatesenderformat.
    METHODS validatereceiverformat FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatereceiverformat.
    METHODS validatemapping FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatemapping.
    METHODS validatesendersec FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatesendersec.
    METHODS validatereceiversec FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatereceiversec.
    METHODS validatesendertype FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatesendertype.
    METHODS validatereceivertype FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatereceivertype.
    METHODS validatemodulename FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatemodulename.
    METHODS validatedeveloper FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatedeveloper.
    METHODS validatefunctional FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_repository~validatefunctional.
*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR zi_repository RESULT result.
**    METHODS hidedevtype FOR MODIFY
**      IMPORTING keys FOR ACTION zi_repository~hidedevtype RESULT result.
*    METHODS hidedevtype FOR DETERMINE ON MODIFY
*      IMPORTING keys FOR zi_repository~hidedevtype.
**    METHODS drafttoactive FOR MODIFY
**      IMPORTING keys FOR ACTION zi_repository~drafttoactive RESULT result.
*    METHODS drafttoactive FOR MODIFY
*      IMPORTING keys FOR ACTION zi_repository~drafttoactive RESULT result.

ENDCLASS.

CLASS lhc_ZI_REPOSITORY IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD validateDevType.
*  " Read relevant project instance data
*    READ ENTITIES OF zi_repository IN LOCAL MODE
*      ENTITY zi_repository
*        FIELDS ( dev_type ) WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_repository).

*    DATA lt_devType_temp TYPE SORTED TABLE OF zdt_devtype_rep WITH UNIQUE KEY dev_type.

    " Optimization of DB select: extract distinct non-initial project
*    lt_devType_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING dev_type = dev_type EXCEPT * ).
*    DELETE lt_devType_temp WHERE dev_type IS INITIAL.
*    IF lt_devType_temp IS NOT INITIAL.
    " Check if project exist
*      SELECT FROM zdt_devtype_rep FIELDS dev_type
*        FOR ALL ENTRIES IN @lt_devType_temp
*        WHERE dev_type = @lt_devType_temp-dev_type
*        INTO TABLE @DATA(lt_devType).
*    ENDIF.

    " Raise msg for non existing and initial project
*    LOOP AT lt_repository INTO DATA(lwa_repository).
*    " Clear state messages that might exist
*      APPEND VALUE #(  %tky        = lwa_repository-%tky
*                       %state_area = 'VALIDATE_DEVTYPE' )
*        TO reported-zi_repository.

*      IF lwa_repository-dev_type IS INITIAL OR NOT line_exists( lt_devType[ dev_type = lwa_repository-dev_type ] ).
*        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

*        APPEND VALUE #(  %tky        = lwa_repository-%tky
*                         %state_area = 'VALIDATE_DEVTYPE'
*                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
*                                              number   = '001' " &1 unknown
*                                              v1 = 'Type of Development'
*                                              v2 = lwa_repository-dev_type
*                                              severity = if_abap_behv_message=>severity-error )
*                         %element-dev_type = if_abap_behv=>mk-on )
*          TO reported-zi_repository.
*      ENDIF.
*    ENDLOOP.
*  ENDMETHOD.

  METHOD validateClientProj.
    " Read relevant project instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( client_prj ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_clientproj_temp TYPE SORTED TABLE OF zdt_clientpj_rep WITH UNIQUE KEY client_proj.

    " Optimization of DB select: extract distinct non-initial project
    lt_clientproj_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING client_proj = client_prj EXCEPT * ).
    DELETE lt_clientproj_temp WHERE client_proj IS INITIAL.
    IF lt_clientproj_temp IS NOT INITIAL.
    " Check if project exist
      SELECT FROM zdt_clientpj_rep FIELDS client_proj
        FOR ALL ENTRIES IN @lt_clientproj_temp
        WHERE client_proj = @lt_clientproj_temp-client_proj
        INTO TABLE @DATA(lt_clientproj).
    ENDIF.

    " Raise msg for non existing and initial project
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_CLIENTPJ' )
        TO reported-zi_repository.

      IF lwa_repository-client_prj IS INITIAL OR NOT line_exists( lt_clientproj[ client_proj = lwa_repository-client_prj ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_CLIENTPJ'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Client'
                                              v2 = lwa_repository-client_prj
                                              severity = if_abap_behv_message=>severity-error )
                         %element-client_prj = if_abap_behv=>mk-on )
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateProject.
  " Read relevant project instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( project ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_project_temp TYPE SORTED TABLE OF zdt_project_rep WITH UNIQUE KEY project.

    " Optimization of DB select: extract distinct non-initial project
    lt_project_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING project = project EXCEPT * ).
    DELETE lt_project_temp WHERE project IS INITIAL.
    IF lt_project_temp IS NOT INITIAL.
    " Check if project exist
      SELECT FROM zdt_project_rep FIELDS project
        FOR ALL ENTRIES IN @lt_project_temp
        WHERE project = @lt_project_temp-project
        INTO TABLE @DATA(lt_project).
    ENDIF.

    " Raise msg for non existing and initial project
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_PROJECT' )
        TO reported-zi_repository.

      IF lwa_repository-project IS INITIAL OR NOT line_exists( lt_project[ project = lwa_repository-project ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_PROJECT'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Project'
                                              v2 = lwa_repository-project
                                              severity = if_abap_behv_message=>severity-error )
                         %element-project = if_abap_behv=>mk-on )
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateIntDomain.
  " Read relevant integration domain instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( integration_dom ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_intDomain_temp TYPE SORTED TABLE OF zdt_integdom_rep WITH UNIQUE KEY integration_dom.

    " Optimization of DB select: extract distinct non-initial integration domain
    lt_intDomain_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING integration_dom = integration_dom EXCEPT * ).
    DELETE lt_intDomain_temp WHERE integration_dom IS INITIAL.
    IF lt_intDomain_temp IS NOT INITIAL.
    " Check if project exist
      SELECT FROM zdt_integdom_rep FIELDS integration_dom
        FOR ALL ENTRIES IN @lt_intDomain_temp
        WHERE integration_dom = @lt_intDomain_temp-integration_dom
        INTO TABLE @DATA(lt_intDomain).
    ENDIF.

    " Raise msg for non existing and initial integration domain
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_INTDOMAIN' )
        TO reported-zi_repository.

      IF lwa_repository-integration_dom IS NOT INITIAL AND
      NOT line_exists( lt_intDomain[ integration_dom = lwa_repository-integration_dom ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_INTDOMAIN'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Integration Domain'
                                              v2 = lwa_repository-integration_dom
                                              severity = if_abap_behv_message=>severity-error )
                         %element-integration_dom = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateIntStyle.
  " Read relevant integration style instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( integration_sty ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_intStyle_temp TYPE SORTED TABLE OF zdt_integsty_rep WITH UNIQUE KEY integration_sty.

    " Optimization of DB select: extract distinct non-initial integration style
    lt_intStyle_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING integration_sty = integration_sty EXCEPT * ).
    DELETE lt_intStyle_temp WHERE integration_sty IS INITIAL.
    IF lt_intStyle_temp IS NOT INITIAL.
    " Check if integration_style exist
      SELECT FROM zdt_integsty_rep FIELDS integration_sty
        FOR ALL ENTRIES IN @lt_intStyle_temp
        WHERE integration_sty = @lt_intStyle_temp-integration_sty
        INTO TABLE @DATA(lt_intStyle).
    ENDIF.

    " Raise msg for non existing and initial integration style
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_INTSTYLE' )
        TO reported-zi_repository.

      IF lwa_repository-integration_sty IS NOT INITIAL AND NOT line_exists( lt_intStyle[ integration_sty = lwa_repository-integration_sty ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_INTSTYLE'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Integration Style'
                                              v2 = lwa_repository-integration_sty
                                              severity = if_abap_behv_message=>severity-error )
                         %element-integration_sty = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateIntPattern.
  " Read relevant integration pattern instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( integration_pat ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_intPattern_temp TYPE SORTED TABLE OF zdt_integpat_rep WITH UNIQUE KEY integration_pat.

    " Optimization of DB select: extract distinct non-initial integration pattern
    lt_intPattern_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING integration_pat = integration_pat EXCEPT * ).
    DELETE lt_intPattern_temp WHERE integration_pat IS INITIAL.
    IF lt_intPattern_temp IS NOT INITIAL.
    " Check if integration pattern exist
      SELECT FROM zdt_integpat_rep FIELDS integration_pat
        FOR ALL ENTRIES IN @lt_intPattern_temp
        WHERE integration_pat = @lt_intPattern_temp-integration_pat
        INTO TABLE @DATA(lt_intPattern).
    ENDIF.

    " Raise msg for non existing and initial integration pattern
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_INTPATTERN' )
        TO reported-zi_repository.

      IF lwa_repository-integration_pat IS NOT INITIAL AND NOT line_exists( lt_intPattern[ integration_pat = lwa_repository-integration_pat ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_INTPATTERN'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Integration Pattern'
                                              v2 = lwa_repository-integration_pat
                                              severity = if_abap_behv_message=>severity-error )
                         %element-integration_pat = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateCommunication.
  " Read relevant communication instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( communication ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Comm_temp TYPE SORTED TABLE OF zdt_comm_rep WITH UNIQUE KEY communication.

    " Optimization of DB select: extract distinct non-initial communication
    lt_Comm_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING communication = communication EXCEPT * ).
    DELETE lt_Comm_temp WHERE communication IS INITIAL.
    IF lt_Comm_temp IS NOT INITIAL.
    " Check if communication exist
      SELECT FROM zdt_comm_rep FIELDS communication
        FOR ALL ENTRIES IN @lt_Comm_temp
        WHERE communication = @lt_Comm_temp-communication
        INTO TABLE @DATA(lt_Comm).
    ENDIF.

    " Raise msg for non existing and initial communication
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_COMMUNICATION' )
        TO reported-zi_repository.

      IF lwa_repository-communication IS NOT INITIAL AND NOT line_exists( lt_Comm[ communication = lwa_repository-communication ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_COMMUNICATION'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Communication'
                                              v2 = lwa_repository-communication
                                              severity = if_abap_behv_message=>severity-error )
                         %element-communication = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateTechnology.
  " Read relevant technology instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( technology ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Tech_temp TYPE SORTED TABLE OF zdt_tech_rep WITH UNIQUE KEY technology.

    " Optimization of DB select: extract distinct non-initial technology
    lt_Tech_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING technology = technology EXCEPT * ).
    DELETE lt_Tech_temp WHERE technology IS INITIAL.
    IF lt_Tech_temp IS NOT INITIAL.
    " Check if technology exist
      SELECT FROM zdt_tech_rep FIELDS technology
        FOR ALL ENTRIES IN @lt_Tech_temp
        WHERE technology = @lt_Tech_temp-technology
        INTO TABLE @DATA(lt_Tech).
    ENDIF.

    " Raise msg for non existing and initial technology
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_TECHNOLOGY' )
        TO reported-zi_repository.

      IF lwa_repository-technology IS NOT INITIAL AND NOT line_exists( lt_Tech[ technology = lwa_repository-technology ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_TECHNOLOGY'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Technology'
                                              v2 = lwa_repository-technology
                                              severity = if_abap_behv_message=>severity-error )
                         %element-technology = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateSenderFormat.
  " Read relevant sender format instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( sender_format ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_senderForm_temp TYPE SORTED TABLE OF zdt_dataform_rep WITH UNIQUE KEY data_format.

    " Optimization of DB select: extract distinct non-initial sender format
    lt_senderForm_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING data_format = sender_format EXCEPT * ).
    DELETE lt_senderForm_temp WHERE data_format IS INITIAL.
    IF lt_senderForm_temp IS NOT INITIAL.
    " Check if sender format exist
      SELECT FROM zdt_dataform_rep FIELDS data_format
        FOR ALL ENTRIES IN @lt_senderForm_temp
        WHERE data_format = @lt_senderForm_temp-data_format
        INTO TABLE @DATA(lt_senderForm).
    ENDIF.

    " Raise msg for non existing and initial sender format
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_SENDERFORMAT' )
        TO reported-zi_repository.

      IF lwa_repository-sender_format IS NOT INITIAL AND NOT line_exists( lt_senderForm[ data_format = lwa_repository-sender_format ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_SENDERFORMAT'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Sender Format'
                                              v2 = lwa_repository-sender_format
                                              severity = if_abap_behv_message=>severity-error )
                         %element-sender_format = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateReceiverFormat.
  " Read relevant receiver format instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( receiver_format ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_receiverForm_temp TYPE SORTED TABLE OF zdt_dataform_rep WITH UNIQUE KEY data_format.

    " Optimization of DB select: extract distinct non-initial receiver format
    lt_receiverForm_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING data_format = receiver_format EXCEPT * ).
    DELETE lt_receiverForm_temp WHERE data_format IS INITIAL.
    IF lt_receiverForm_temp IS NOT INITIAL.
    " Check if receiver format exist
      SELECT FROM zdt_dataform_rep FIELDS data_format
        FOR ALL ENTRIES IN @lt_receiverForm_temp
        WHERE data_format = @lt_receiverForm_temp-data_format
        INTO TABLE @DATA(lt_receiverForm).
    ENDIF.

    " Raise msg for non existing and initial receiver format
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_RECEIVERFORMAT' )
        TO reported-zi_repository.

      IF lwa_repository-receiver_format IS NOT INITIAL AND NOT line_exists( lt_receiverForm[ data_format = lwa_repository-receiver_format ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_RECEIVERFORMAT'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Receiver Format'
                                              v2 = lwa_repository-receiver_format
                                              severity = if_abap_behv_message=>severity-error )
                         %element-receiver_format = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateMapping.
   " Read relevant mapping instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( mapping ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Mapping_temp TYPE SORTED TABLE OF zdt_mapping_rep WITH UNIQUE KEY mapping.

    " Optimization of DB select: extract distinct non-initial mapping
    lt_Mapping_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING mapping = mapping EXCEPT * ).
    DELETE lt_Mapping_temp WHERE mapping IS INITIAL.
    IF lt_Mapping_temp IS NOT INITIAL.
    " Check if mapping exist
      SELECT FROM zdt_mapping_rep FIELDS mapping
        FOR ALL ENTRIES IN @lt_Mapping_temp
        WHERE mapping = @lt_Mapping_temp-mapping
        INTO TABLE @DATA(lt_mapping).
    ENDIF.

    " Raise msg for non existing and initial mapping
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_MAPPING' )
        TO reported-zi_repository.

      IF lwa_repository-mapping IS NOT INITIAL AND NOT line_exists( lt_mapping[ mapping = lwa_repository-mapping ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_MAPPING'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Mapping'
                                              v2 = lwa_repository-mapping
                                              severity = if_abap_behv_message=>severity-error )
                         %element-mapping = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateSenderSec.
  " Read relevant sender security instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( sender_sec ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Sender_temp TYPE SORTED TABLE OF zdt_security_rep WITH UNIQUE KEY security.

    " Optimization of DB select: extract distinct non-initial sender security
    lt_Sender_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING security = sender_sec EXCEPT * ).
    DELETE lt_Sender_temp WHERE security IS INITIAL.
    IF lt_Sender_temp IS NOT INITIAL.
    " Check if sender security exist
      SELECT FROM zdt_security_rep FIELDS security
        FOR ALL ENTRIES IN @lt_Sender_temp
        WHERE security = @lt_Sender_temp-security
        INTO TABLE @DATA(lt_senderSec).
    ENDIF.

    " Raise msg for non existing and initial sender security
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_SENDERSEC' )
        TO reported-zi_repository.

      IF lwa_repository-sender_sec IS NOT INITIAL AND NOT line_exists( lt_senderSec[ security = lwa_repository-sender_sec ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_SENDERSEC'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Sender Security'
                                              v2 = lwa_repository-sender_sec
                                              severity = if_abap_behv_message=>severity-error )
                         %element-sender_sec = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateReceiverSec.
  " Read relevant receiver security instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( receiver_sec ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_ReceiverSec_temp TYPE SORTED TABLE OF zdt_security_rep WITH UNIQUE KEY security.

    " Optimization of DB select: extract distinct non-initial receiver security
    lt_ReceiverSec_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING security = receiver_sec EXCEPT * ).
    DELETE lt_ReceiverSec_temp WHERE security IS INITIAL.
    IF lt_ReceiverSec_temp IS NOT INITIAL.
    " Check if receiver security exist
      SELECT FROM zdt_security_rep FIELDS security
        FOR ALL ENTRIES IN @lt_ReceiverSec_temp
        WHERE security = @lt_ReceiverSec_temp-security
        INTO TABLE @DATA(lt_receiverSec).
    ENDIF.

    " Raise msg for non existing and initial receiver security
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_RECEIVERSEC' )
        TO reported-zi_repository.

      IF lwa_repository-receiver_sec IS NOT INITIAL AND NOT line_exists( lt_receiverSec[ security = lwa_repository-receiver_sec ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_RECEIVERSEC'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Receiver Security'
                                              v2 = lwa_repository-receiver_sec
                                              severity = if_abap_behv_message=>severity-error )
                         %element-receiver_sec = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateSenderType.
  " Read relevant receiver security instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( sender_type ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_senderType_temp TYPE SORTED TABLE OF zdt_integtyp_rep WITH UNIQUE KEY integration_type.

    " Optimization of DB select: extract distinct non-initial sender integration type
    lt_senderType_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING integration_type = sender_type EXCEPT * ).
    DELETE lt_senderType_temp WHERE integration_type IS INITIAL.
    IF lt_senderType_temp IS NOT INITIAL.
    " Check if sender security exist
      SELECT FROM zdt_integtyp_rep FIELDS integration_type
        FOR ALL ENTRIES IN @lt_senderType_temp
        WHERE integration_type = @lt_senderType_temp-integration_type
        INTO TABLE @DATA(lt_senderType).
    ENDIF.

    " Raise msg for non existing and initial sender integration type
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_SENDERTYPE' )
        TO reported-zi_repository.

      IF lwa_repository-sender_type IS NOT INITIAL AND NOT line_exists( lt_senderType[ integration_type = lwa_repository-sender_type ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_SENDERTYPE'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Sender Type'
                                              v2 = lwa_repository-sender_type
                                              severity = if_abap_behv_message=>severity-error )
                         %element-sender_type = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateReceiverType.
  " Read relevant receiver integration type instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( receiver_type ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_receiverType_temp TYPE SORTED TABLE OF zdt_integtyp_rep WITH UNIQUE KEY integration_type.

    " Optimization of DB select: extract distinct non-initial receiver integration type
    lt_receiverType_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING integration_type = receiver_type EXCEPT * ).
    DELETE lt_receiverType_temp WHERE integration_type IS INITIAL.
    IF lt_receiverType_temp IS NOT INITIAL.
    " Check if sender security exist
      SELECT FROM zdt_integtyp_rep FIELDS integration_type
        FOR ALL ENTRIES IN @lt_receiverType_temp
        WHERE integration_type = @lt_receiverType_temp-integration_type
        INTO TABLE @DATA(lt_receiverType).
    ENDIF.

    " Raise msg for non existing and initial receiver integration type
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_RECEIVERTYPE' )
        TO reported-zi_repository.

      IF lwa_repository-receiver_type IS NOT INITIAL AND NOT line_exists( lt_receiverType[ integration_type = lwa_repository-receiver_type ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_RECEIVERTYPE'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Receiver Type'
                                              v2 = lwa_repository-receiver_type
                                              severity = if_abap_behv_message=>severity-error )
                         %element-receiver_type = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateModuleName.
  " Read relevant module instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( module_name ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_moduleName_temp TYPE SORTED TABLE OF zdt_module_rep WITH UNIQUE KEY module_name.

    " Optimization of DB select: extract distinct non-initial module
    lt_moduleName_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING module_name = module_name EXCEPT * ).
    DELETE lt_moduleName_temp WHERE module_name IS INITIAL.
    IF lt_moduleName_temp IS NOT INITIAL.
    " Check if module exist
      SELECT FROM zdt_module_rep FIELDS module_name
        FOR ALL ENTRIES IN @lt_moduleName_temp
        WHERE module_name = @lt_moduleName_temp-module_name
        INTO TABLE @DATA(lt_moduleName).
    ENDIF.

    " Raise msg for non existing and initial module
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_MODULENAME' )
        TO reported-zi_repository.

      IF lwa_repository-module_name IS NOT INITIAL AND NOT line_exists( lt_moduleName[ module_name = lwa_repository-module_name ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_MODULENAME'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Module Name'
                                              v2 = lwa_repository-module_name
                                              severity = if_abap_behv_message=>severity-error )
                         %element-module_name = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateDeveloper.
  " Read relevant developer instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( developer ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Developer_temp TYPE SORTED TABLE OF zdt_consultant WITH UNIQUE KEY consultant.

    " Optimization of DB select: extract distinct non-initial developer
    lt_Developer_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING consultant = developer EXCEPT * ).
    DELETE lt_Developer_temp WHERE consultant IS INITIAL.
    IF lt_Developer_temp IS NOT INITIAL.
    " Check if developer exist
      SELECT FROM zdt_consultant FIELDS consultant
        FOR ALL ENTRIES IN @lt_Developer_temp
        WHERE consultant = @lt_Developer_temp-consultant
        INTO TABLE @DATA(lt_Developer).
    ENDIF.

    " Raise msg for non existing and initial developer
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_DEVELOPER' )
        TO reported-zi_repository.

      IF lwa_repository-developer IS NOT INITIAL AND NOT line_exists( lt_Developer[ consultant = lwa_repository-developer ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_DEVELOPER'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Developer'
                                              v2 = lwa_repository-developer
                                              severity = if_abap_behv_message=>severity-error )
                         %element-developer = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateFunctional.
  " Read relevant functional instance data
    READ ENTITIES OF zi_repository IN LOCAL MODE
      ENTITY zi_repository
        FIELDS ( functional ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_repository).

    DATA lt_Function_temp TYPE SORTED TABLE OF zdt_consultant WITH UNIQUE KEY consultant.

    " Optimization of DB select: extract distinct non-initial functional
    lt_Function_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING consultant = functional EXCEPT * ).
    DELETE lt_Function_temp WHERE consultant IS INITIAL.
    IF lt_Function_temp IS NOT INITIAL.
    " Check if functional exist
      SELECT FROM zdt_consultant FIELDS consultant
        FOR ALL ENTRIES IN @lt_Function_temp
        WHERE consultant = @lt_Function_temp-consultant
        INTO TABLE @DATA(lt_Function).
    ENDIF.

    " Raise msg for non existing and initial functional
    LOOP AT lt_repository INTO DATA(lwa_repository).
    " Clear state messages that might exist
      APPEND VALUE #(  %tky        = lwa_repository-%tky
                       %state_area = 'VALIDATE_FUNCTIONAL' )
        TO reported-zi_repository.

      IF lwa_repository-functional IS NOT INITIAL AND NOT line_exists( lt_Function[ consultant = lwa_repository-functional ] ).
        APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

        APPEND VALUE #(  %tky        = lwa_repository-%tky
                         %state_area = 'VALIDATE_FUNCTIONAL'
                         %msg = new_message(  id = 'Z_MSG_REPOSITORY'
                                              number   = '001' " &1 unknown
                                              v1 = 'Functional'
                                              v2 = lwa_repository-functional
                                              severity = if_abap_behv_message=>severity-error )
                         %element-functional = if_abap_behv=>mk-on ) "display fieldname that is triggering the error
          TO reported-zi_repository.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

*  METHOD get_instance_features.

    " Read relevant project instance data
*    READ ENTITIES OF zi_repository IN LOCAL MODE
*      ENTITY zi_repository
*        FIELDS ( project ) WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_repository).

*    DATA lt_project_temp TYPE SORTED TABLE OF zdt_project_rep WITH UNIQUE KEY project.

    " Optimization of DB select: extract distinct non-initial project
*    lt_project_temp = CORRESPONDING #( lt_repository DISCARDING DUPLICATES MAPPING project = project EXCEPT * ).
*    DELETE lt_project_temp WHERE project IS INITIAL.
*    IF lt_project_temp IS NOT INITIAL.
        "Set as read-only if project is not initial meaning edit mode as it is mandatory field upon creation
*        result = VALUE #( FOR lwa_repository IN lt_repository
*                 ( %tky  = lwa_repository-%tky
*                   %field-dev_type  = COND #( WHEN lwa_repository-project IS NOT INITIAL
*                                        THEN if_abap_behv=>perm-f-read_only"fc-f-read_only
*                                        ELSE if_abap_behv=>fc-f-mandatory )
*                    ) ).
*    ENDIF.
*  ENDMETHOD.

*  METHOD hideDevType.

*    TYPES tt_elements TYPE SORTED TABLE OF string WITH UNIQUE DEFAULT KEY.

*     TYPES:BEGIN OF lt_integHide,
*          uict_integ_hide TYPE string,
*          END OF lt_integHide.

*     DATA: lr_zclass TYPE REF TO zcl_integ_hide,
*           lt_calc_elements TYPE tt_elements.
**           lt_calc_data TYPE TABLE OF tt_elements.
**      result_table TYPE STANDARD TABLE OF <result_line_type>.

*      DATA:
*            lt_calc_data TYPE STANDARD TABLE OF lt_integHide WITH DEFAULT KEY.

**      APPEND 'UICT_INTEG_HIDE' TO lt_calc_elements.
**      APPEND INITIAL LINE TO lt_calc_data.

*      READ ENTITIES OF zi_repository IN LOCAL MODE
*      ENTITY zi_repository
*        FIELDS ( dev_type upload_flag ) WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_repository).

**      APPEND lt_calc_elements TO lt_calc_data.

**      CREATE OBJECT lr_zclass.
**      lr_zclass->if_sadl_exit_calc_element_read~calculate(
**        EXPORTING
**        it_original_data = lt_repository
**        it_requested_calc_elements = lt_calc_elements
**        CHANGING
**        ct_calculated_data = lt_calc_data
**    ).

*         READ TABLE lt_repository INTO DATA(lwa_repository) INDEX 1.

**    MODIFY ENTITIES OF zi_repository IN LOCAL MODE
**        ENTITY zi_repository
**        UPDATE FIELDS ( ricefw_id module_name ) WITH VALUE #(
**        FOR lwa_repo IN lt_repository INDEX INTO i ( %tky = lwa_repo-%tky
**                                                 %control-ricefw_id = if_abap_behv=>perm-f-read_only
**                                                 %control-module_name = if_abap_behv=>perm-f-read_only ) )
**        REPORTED DATA(lt_reported).
**        reported = CORRESPONDING #( DEEP lt_reported ).

*    IF lwa_repository-upload_flag IS INITIAL.
*        IF lwa_repository-dev_type = 'Integration'.
*            MODIFY ENTITIES OF zi_repository IN LOCAL MODE
*            ENTITY zi_repository
*            UPDATE FIELDS ( odata bsp_app form_type ) WITH VALUE #(
*            FOR lwa_repo IN lt_repository INDEX INTO i ( %tky = lwa_repo-%tky
*                                                     %control-odata = if_abap_behv=>fc-f-read_only
*                                                     %control-bsp_app = if_abap_behv=>perm-f-read_only
*                                                     %control-form_type = if_abap_behv=>perm-f-read_only ) )

*            REPORTED DATA(lt_reported).
    "        reported = CORRESPONDING #( DEEP lt_reported ).
*        ELSEIF lwa_repository-dev_type = 'Fiori'.
*            MODIFY ENTITIES OF zi_repository IN LOCAL MODE
*            ENTITY zi_repository
*            UPDATE FIELDS ( interface IFlow integration_dom
*                            integration_sty integration_pat sender
*                            receiver communication technology
*                            sender_format receiver_format Mapping
*                            sender_sec receiver_sec sender_type
*                            receiver_type form_type ) WITH VALUE #(
*            FOR lwa_repo IN lt_repository INDEX INTO i ( %tky = lwa_repo-%tky
*                                                     %control-interface = if_abap_behv=>perm-f-read_only
*                                                     %control-IFlow = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_dom = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_sty = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_pat = if_abap_behv=>perm-f-read_only
*                                                     %control-sender = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver = if_abap_behv=>perm-f-read_only
*                                                     %control-communication = if_abap_behv=>perm-f-read_only
*                                                     %control-technology = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_format = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_format = if_abap_behv=>perm-f-read_only
*                                                     %control-Mapping = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_sec = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_sec = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_type = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_type = if_abap_behv=>perm-f-read_only
*                                                     %control-form_type = if_abap_behv=>perm-f-read_only ) )
*            REPORTED lt_reported.
    "        reported = CORRESPONDING #( DEEP lt_reported ).
*        ELSEIF lwa_repository-dev_type = 'Form'.
*            MODIFY ENTITIES OF zi_repository IN LOCAL MODE
*            ENTITY zi_repository
*            UPDATE FIELDS ( interface IFlow integration_dom
*                            integration_sty integration_pat sender
*                            receiver communication technology
*                            sender_format receiver_format Mapping
*                            sender_sec receiver_sec sender_type
*                            receiver_type odata bsp_app ) WITH VALUE #(
*            FOR lwa_repo IN lt_repository INDEX INTO i ( %tky = lwa_repo-%tky
**        *                                               %key = lwa_repo-%key
**                                                        %is_draft = '01'
**                                                       ricefw_id = 'xt'  ) )
*                                                     %control-interface = if_abap_behv=>perm-f-read_only
*                                                     %control-IFlow = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_dom = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_sty = if_abap_behv=>perm-f-read_only
*                                                     %control-integration_pat = if_abap_behv=>perm-f-read_only
*                                                     %control-sender = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver = if_abap_behv=>perm-f-read_only
*                                                     %control-communication = if_abap_behv=>perm-f-read_only
*                                                     %control-technology = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_format = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_format = if_abap_behv=>perm-f-read_only
*                                                     %control-Mapping = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_sec = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_sec = if_abap_behv=>perm-f-read_only
*                                                     %control-sender_type = if_abap_behv=>perm-f-read_only
*                                                     %control-receiver_type = if_abap_behv=>perm-f-read_only
*                                                     %control-odata = if_abap_behv=>perm-f-read_only
*                                                     %control-bsp_app = if_abap_behv=>perm-f-read_only ) )

**        *    FOR key IN keys ( %tky = key-%tky Developer = COND #( WHEN lwa_repository-project = 'Fonterra'
**        *                                                                THEN 'yes'
**        *                                                                ELSE 'no'   )
**        *                                                                ) )
**            MAPPED DATA(lt_mapped)
**            FAILED DATA(lt_failed)
*            REPORTED lt_reported.
    "        reported = CORRESPONDING #( DEEP lt_reported ).
*        ENDIF.

        " Clear state messages that might exist
*        APPEND VALUE #(  %tky        = lwa_repository-%tky
*                           %state_area = 'VALUE_REMOVAL' )
*            TO reported-zi_repository.

     "   APPEND VALUE #(  %tky = lwa_repository-%tky ) TO failed-zi_repository.

*        APPEND VALUE #(  %tky        = lwa_repository-%tky
*                             %state_area = 'VALUE_REMOVAL'
*                             %msg = new_message(  id = 'Z_MSG_REPOSITORY'
*                                                  number   = '002' " &1 unknown
*                                                  v2 = lwa_repository-dev_type
*                                                  severity = if_abap_behv_message=>severity-information )
*                             %element-dev_type = if_abap_behv=>mk-on "display fieldname that is triggering the error and show msg right underneath the field
*                           )
*        TO lt_reported-zi_repository.
*        reported = CORRESPONDING #( DEEP lt_reported ).

*    ENDIF.

*    READ ENTITIES OF zi_repository IN LOCAL MODE
*      ENTITY zi_repository
*        FIELDS ( UICT_INTEG_HIDE ) WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_repository1).

*  ENDMETHOD.

*  METHOD draftToActive.
**   Modify the entities with required fields.
*    MODIFY ENTITIES OF zi_repository IN LOCAL MODE
*      ENTITY zi_repository
*      UPDATE FIELDS ( statcode )
*          WITH VALUE #( FOR key IN keys ( %tky = key-%tky
*                                          statcode ='MASS' ) ).

**   Check if there are any draft instances?
*    DATA(lt_draft_docs) = keys.
*    DELETE lt_draft_docs WHERE %is_draft = if_abap_behv=>mk-off.

*    IF lt_draft_docs IS NOT INITIAL.

** EXECUTE Active only on draft instances.

*        MODIFY ENTITIES OF ZI_REPOSITORY IN LOCAL MODE
*          ENTITY zi_repository
*            EXECUTE Activate FROM
*            VALUE #( FOR key IN keys ( %key = key-%key ) )
*          REPORTED DATA(activate_reported)
*          FAILED DATA(activate_failed)
*          MAPPED DATA(activate_mapped).

*   ENDIF.

** Change Keys to read active Instance
*    DATA(lt_keys) = keys.
*    LOOP AT lt_keys ASSIGNING FIELD-SYMBOL(<ls_key>).
*      <ls_key>-%is_draft = if_abap_behv=>mk-off.
*    ENDLOOP.

** Read the active instance to send back to Fiori App.
*    READ ENTITIES OF ZI_REPOSITORY IN LOCAL MODE
*        ENTITY zi_repository
*        ALL FIELDS WITH CORRESPONDING #( lt_keys )
*        RESULT DATA(lt_repository).

**    result = VALUE #( FOR ls_repository IN lt_repository ( %tky   = ls_repository-%tky
**                                                   %param = CORRESPONDING #( ls_repository ) ) ).

*    result = VALUE #( for ls_repository in lt_repository ( %tky-%key = ls_repository-%key
*                                                      %tky-uuid = ls_repository-uuid
*                                                      %tky-%is_draft = if_abap_behv=>mk-on
*                                                      %key = ls_repository-%key
*                                                      %param = CORRESPONDING #( ls_repository ) ) ).
** Populate %key , %tky  to be filled from source instance while %param-%key to be filled from new instance.
**    result = VALUE #( for <fs_old_key> in keys
**                      for <fs_new_key> IN lt_keys WHERE ( UUID = <Fs_old_key>-UUID )
**                                                    ( %key = <fs_old_key>-%key
**                                                      %tky = <fs_old_key>-%tky
**                                                      %param-%key = <fs_new_key>-%key ) ).

*    mapped-zi_repository = CORRESPONDING #( lt_repository ).

*  ENDMETHOD.

ENDCLASS.
