@AbapCatalog.sqlViewName: 'Z_05_DEMO09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo08 Path Expressions'
define view Z_05_Demo9 as select from Z_05_Demo8
{
    key Carrid,
    key Connid,
    Cityfrom,
    Cityto,
    _Carrier.carrname as CarrierName,
    
    /* Associations */
    _Flights
}
