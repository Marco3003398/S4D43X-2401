@EndUserText.label: 'Carrier Text'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_05_CarrierText as select from scarr
{
    key carrid as CarrierID,
    carrname as CarrierName
}
