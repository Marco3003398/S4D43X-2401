@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'
define root view entity ZI_05_Flight 
  as select from sflight
  composition [0..*] of ZI_05_Booking as _Bookings
  association [1..1] to ZI_05_CarrierText as _CarrierText on $projection.CarrierID = _CarrierText.CarrierID
{
    @ObjectModel.text.element: ['CarrierName']
    key carrid as CarrierID,
    key connid as ConnectionID,
    key fldate as Flightdate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price      as FlightPrice,
    currency   as CurrencyCode,
    planetype  as PlaneType,
    seatsmax   as MaximumSeatsEconomyClass,
    seatsocc   as OccupiedSeatsEconomyClass,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    paymentsum as PaymentSum,
    seatsmax_b as MaximumSeatsBusinessClass,
    seatsocc_b as OccupiedSeatsBusinessClass,
    seatsmax_f as MaximumSeatsFirstClass,
    seatsocc_f as OccupiedSeatsFirstClass,
    
    _CarrierText.CarrierName as CarrierName,
    case when dats_days_between($session.system_date, fldate) >= 14 then 3
         when dats_days_between($session.system_date, fldate) >= 7 then 2
         when dats_days_between($session.system_date, fldate) >= 0 then 1
         else 0 end as FlightDateCriticality,
    
    _Bookings
}
