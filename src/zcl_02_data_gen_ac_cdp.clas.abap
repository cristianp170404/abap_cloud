CLASS zcl_02_data_gen_ac_cdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "-------------------------------------------------------------------
    " Method: IS_VALID_EMAIL
    " Purpose: Validates the format of an email address.
    " Importing:
    "   IV_EMAIL - The email address to validate (type STRING)
    " Returning:
    "   RV_IS_VALID - ABAP_BOOL, true if the email is valid, false otherwise
    "-------------------------------------------------------------------
    METHODS is_valid_email
      IMPORTING
        VALUE(iv_email)    TYPE string
      RETURNING
        VALUE(rv_is_valid) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_data_gen_ac_cdp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Adding Travel data....' ).

    DELETE FROM zlgl_travel.

    INSERT zcdp_travel FROM (

                SELECT FROM /dmo/travel
                  FIELDS
                    " client
                    uuid( ) AS travel_uuid,
                    travel_id,
                    agency_id,
                    customer_id,
                    begin_date,
                    end_date,
                    booking_fee,
                    total_price,
                    currency_code,
                    description,
                    CASE status WHEN 'B' THEN 'A'
                                WHEN 'P' THEN 'O'
                                WHEN 'N' THEN 'O'
                                ELSE 'X' END AS overall_status,
                    createdby AS local_created_by,
                    createdat AS local_created_at,
                    lastchangedby AS local_last_changed_by,
                    lastchangedat AS local_last_changed_at,
                    lastchangedat AS last_changed_at ).

    out->write( |{ sy-dbcnt } rows added.| ).

  ENDMETHOD.

  METHOD is_valid_email.
    rv_is_valid = abap_false.
    IF iv_email CP '*@*.*' AND iv_email CA '@' AND iv_email CA '.'.
      rv_is_valid = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
