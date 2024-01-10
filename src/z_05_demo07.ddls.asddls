@AbapCatalog.sqlViewName: 'Z_05_DEMO07'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo07 Outer Joins'
define view Z_05_Demo7 
  as select from spfli as Connection
  //right outer join scarr     as Carrier on Carrier.carrid = Connection.carrid
  right outer join sflight   as Flight  on  Flight.carrid = Connection.carrid 
                                        and Flight.connid = Connection.connid
{
    key Connection.carrid      as Carrid,
    key Connection.connid       as Connid,
    key Flight.fldate       as FlDate,
    //    Carrier.carrname    as carrname,
        Connection.cityfrom as Cityfrom,
        Connection.cityto   as Cityto
}
where 
 Connection.fltype <> 'x' //not equal
