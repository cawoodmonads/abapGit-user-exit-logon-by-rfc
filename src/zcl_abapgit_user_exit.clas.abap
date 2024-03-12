CLASS zcl_abapgit_user_exit DEFINITION FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_abapgit_exit.
ENDCLASS.

CLASS zcl_abapgit_user_exit IMPLEMENTATION.

  METHOD zif_abapgit_exit~create_http_client.
    DATA(lv_host) = zcl_abapgit_url=>host( iv_url ).

    DATA(lv_destination) = COND rfcdest( WHEN lv_host CS 'gitlab' THEN |GITLAB|
                                         WHEN lv_host CS 'github' THEN |GITHUB| ).

    IF lv_destination IS INITIAL.
      RETURN.
    ENDIF.

    cl_http_client=>create_by_destination(
      EXPORTING
        destination              = lv_destination
      IMPORTING
        client                   = ri_client
      EXCEPTIONS
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        OTHERS                   = 6 ).

    IF sy-subrc <> 0.
      zcx_abapgit_exception=>raise_t100(  ).
    ENDIF.
  ENDMETHOD.

METHOD zif_abapgit_exit~adjust_display_commit_url.
  ENDMETHOD.
  METHOD zif_abapgit_exit~adjust_display_filename.
  ENDMETHOD.
  METHOD zif_abapgit_exit~allow_sap_objects.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_local_host.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_max_parallel_processes.
  ENDMETHOD.
  METHOD zif_abapgit_exit~enhance_repo_toolbar.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_proxy_authentication.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_proxy_port.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_proxy_url.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_rfc_server_group.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_supported_data_objects.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_supported_object_types.
  ENDMETHOD.
  METHOD zif_abapgit_exit~change_tadir.
  ENDMETHOD.
  METHOD zif_abapgit_exit~http_client.
  ENDMETHOD.
  METHOD zif_abapgit_exit~custom_serialize_abap_clif.
  ENDMETHOD.
  METHOD zif_abapgit_exit~deserialize_postprocess.
  ENDMETHOD.
  METHOD zif_abapgit_exit~determine_transport_request.
  ENDMETHOD.
  METHOD zif_abapgit_exit~get_ci_tests.
  ENDMETHOD.
  METHOD zif_abapgit_exit~get_ssl_id.
  ENDMETHOD.
  METHOD zif_abapgit_exit~on_event.
  ENDMETHOD.
  METHOD zif_abapgit_exit~pre_calculate_repo_status.
  ENDMETHOD.
  METHOD zif_abapgit_exit~serialize_postprocess.
  ENDMETHOD.
  METHOD zif_abapgit_exit~validate_before_push.
  ENDMETHOD.
  METHOD zif_abapgit_exit~wall_message_list.
  ENDMETHOD.
  METHOD zif_abapgit_exit~wall_message_repo.
  ENDMETHOD.

ENDCLASS.
