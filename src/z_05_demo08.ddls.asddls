@AbapCatalog.sqlViewName: 'Z_05_DEMO08'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo08 Associations'
define view Z_05_Demo8 //Association = Left Outer Join
  as select from spfli as Connection
    association [1..1] to scarr     as _Carrier on _Carrier.carrid = Connection.carrid
    association [0..*] to sflight   as _Flights  on  _Flights.carrid = Connection.carrid 
                                                 and _Flights.connid = Connection.connid
{
    key Connection.carrid   as Carrid,
    key Connection.connid   as Connid,
        Connection.cityfrom as Cityfrom,
        Connection.cityto   as Cityto,
        
        /*Associations*/
        _Carrier,
        _Flights
}
where 
 Connection.fltype <> 'x' //not equal
