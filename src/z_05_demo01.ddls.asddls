@AbapCatalog.sqlViewName: 'Z_05_DEMO01'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo01'
define view Z_05_Demo1 
  as select from sflight as Flight
{
    key carrid as Carrid,
    key connid as ConnectionID,
    key fldate as FlightDate,
        price as FlightPrice,
        currency as Currency,
        planetype as PlaneType
}
