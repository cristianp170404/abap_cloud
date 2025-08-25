CLASS zcl_abap_cloud_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_cloud_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    out->write( 'Hello, ABAP Cloud!' ).
    out->write( 'Super New Stage!' ).
  ENDMETHOD.

ENDCLASS.
