CLASS zjl_insert_repository_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZJL_INSERT_REPOSITORY_DATA IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
*    DATA:it_repository TYPE TABLE OF zdt_repository.
    DATA:it_interface TYPE TABLE OF zdt_interface.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_interface = VALUE #(
*    it_repository = VALUE #(
        ( project = 'Buchholm' interface = '3' )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zdt_interface.
*    DELETE FROM zdt_repository.
*   insert the new table entries
    INSERT zdt_interface FROM TABLE @it_interface.
*    INSERT zdt_repository FROM TABLE @it_repository.

*   check the result
    SELECT * FROM zdt_interface INTO TABLE @it_interface.
*    SELECT * FROM zdt_repository INTO TABLE @it_repository.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.
ENDCLASS.
