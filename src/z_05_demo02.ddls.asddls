@AbapCatalog.sqlViewName: 'Z_05_DEMO02'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo02 Inner Joins'
define view Z_05_Demo2 
  as select from spfli as Connection
  inner join scarr   as Carrier on Carrier.carrid = Connection.carrid
  inner join sflight as Flight  on  Flight.carrid = Connection.carrid 
                                and Flight.connid = Connection.connid
{
    key Carrier.carrid      as Carrid,
    key Flight.connid       as Connid,
    key Flight.fldate       as FlDate,
        Carrier.carrname    as carrname,
        Connection.cityfrom as Cityfrom,
        Connection.cityto   as Cityto
}
where 
 Connection.fltype <> 'x'
