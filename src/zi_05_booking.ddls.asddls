@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZI_05_Booking as select from sbook
association to parent ZI_05_Flight as _Flight on $projection.Carrid = _Flight.CarrierID
                                              and $projection.Connid = _Flight.ConnectionID
                                              and $projection.Fldate = _Flight.Flightdate
{
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    key bookid as Bookid,
    @ObjectModel.text.element: ['Passname']
    customid as Customid,
    custtype as Custtype,
    smoker as Smoker,
    @Semantics.quantity.unitOfMeasure: 'Wunit'
    luggweight as Luggweight,
    wunit as Wunit,
    invoice as Invoice,
    class as Class,
    forcuram as Forcuram,
    forcurkey as Forcurkey,
    loccuram as Loccuram,
    loccurkey as Loccurkey,
    order_date as OrderDate,
    counter as Counter,
    agencynum as Agencynum,
    cancelled as Cancelled,
    reserved as Reserved,
    passname as Passname,
    passform as Passform,
    passbirth as Passbirth,
    _Flight 
}
