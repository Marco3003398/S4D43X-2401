@AbapCatalog.sqlViewName: 'Z_05_DEMO05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 05 Aggregations'
define view Z_05_demo5 
  as select from sflight
{
    carrid,
    count(*) as NumberOfFlights,
    count(distinct planetype)                            as NumberOfDifferentPlaneTypes,
    count(distinct carrid)                               as NumberOfDifferentAirlines,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum(paymentsum)                                      as TotalRevenue,
    currency                                             as Currency,
    
    avg(price as abap.dec(16,2))                         as AveragePrice,
    
    min(seatsocc) as MinimumOccupiedSeats,
    max(seatsocc) as MaximumOccupiedSeats,
    sum(case when seatsocc = 0        then 1 else 0 end) as NumberOfEmptyFlights,
    sum(case when seatsocc = seatsmax then 1 else 0 end) as NumberOfBookedFlights
}
where
  planetype = 'A380-800'
group by
    currency,
    carrid
having
    sum(paymentsum) > 5000000

