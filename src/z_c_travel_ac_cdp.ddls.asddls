@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_AC_CDP 
provider contract transactional_query
as projection on z_i_travel_ac_cdp
{
    key TravelUuid,
    TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' },
    useForValidation: true  }]
    CurrencyCode,
    Description,
    OverallStatus,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
