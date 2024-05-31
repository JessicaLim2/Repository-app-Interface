CLASS zcl_integ_hide DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces  IF_SADL_EXIT_CALC_ELEMENT_READ.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_INTEG_HIDE IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
  FIELD-SYMBOLS: <lv_data>     TYPE any,
                 <lv_data2>    TYPE any.

    LOOP AT it_original_data ASSIGNING <lv_data>.
* Set index
      ASSIGN COMPONENT 'tech_area' OF STRUCTURE <lv_data> TO <lv_data2>.
      IF <lv_data2> IS ASSIGNED AND <lv_data2> <> ''.

         DATA(lv_index) = sy-tabix.

         "Hide Integration Collection
         ASSIGN COMPONENT to_upper( 'UICT_INTEG_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_integ>).
         IF <lv_integ> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Interface'.
*            'Fiori' OR <lv_data2> = 'Form'.
*           abap_true means hide
                <lv_integ> = abap_true.
            ELSE.
                <lv_integ> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Fiori Collection
         ASSIGN COMPONENT to_upper( 'UICT_FIORI_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_fiori>).
         IF <lv_fiori> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Fiori'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Form'.
*             abap_true means hide
               <lv_fiori> = abap_true.
            ELSE.
               <lv_fiori> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Form Collection
         ASSIGN COMPONENT to_upper( 'UICT_FORM_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_form>).
         IF <lv_form> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Form'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Fiori'.
*           abap_true means hide
                <lv_form> = abap_true.
            ELSE.
                <lv_form> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Report Collection
         ASSIGN COMPONENT to_upper( 'UICT_REPORT_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_report>).
         IF <lv_report> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Report'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Fiori'.
*           abap_true means hide
                <lv_report> = abap_true.
            ELSE.
                <lv_report> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Enhancement Collection
         ASSIGN COMPONENT to_upper( 'UICT_ENHANCEMENT_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_enhancement>).
         IF <lv_enhancement> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Enhancement'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Fiori'.
*           abap_true means hide
                <lv_enhancement> = abap_true.
            ELSE.
                <lv_enhancement> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Conversion Collection
         ASSIGN COMPONENT to_upper( 'UICT_CONVERSION_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_conversion>).
         IF <lv_conversion> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Conversion'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Fiori'.
*           abap_true means hide
                <lv_conversion> = abap_true.
            ELSE.
                <lv_conversion> = abap_false.
            ENDIF.
         ENDIF.

         "Hide Workflow Collection
         ASSIGN COMPONENT to_upper( 'UICT_WORKFLOW_HIDE' )  OF STRUCTURE ct_calculated_data[ lv_index ] TO FIELD-SYMBOL(<lv_workflow>).
         IF <lv_workflow> IS ASSIGNED.
            IF NOT <lv_data2> EQ 'Workflow'.
*            <lv_data2> = 'Interface' OR <lv_data2> = 'Fiori'.
*           abap_true means hide
                <lv_workflow> = abap_true.
            ELSE.
                <lv_workflow> = abap_false.
            ENDIF.
         ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    IF iv_entity EQ 'ZI_REPOSITORY'.
      INSERT |UICT_INTEG_HIDE| INTO TABLE et_requested_orig_elements.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
