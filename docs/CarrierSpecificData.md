# CMACGMClient::CarrierSpecificData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **internal_event_code** | **String** | CMA internal event Code | [optional] |
| **internal_event_label** | **String** | CMA internal event Label | [optional] |
| **internal_location_code** | **String** | CMA internal location Code | [optional] |
| **internal_facility_code** | **String** | CMA internal facility Code | [optional] |
| **booking_export_voyage_reference** | **String** | Carrier export voyage reference defined on Booking | [optional] |
| **transportation_phase** | **String** | The Transportation phase, Export, Transshipent or Import | [optional] |
| **shipment_location_type** | **String** | The location type for the shipment | [optional] |
| **transport_call_sequence_total** | **Integer** | The total number of sequence provided in transportation plan | [optional] |
| **number_of_units** | **Integer** | The total number equipment units concerned by the message | [optional] |
| **customs_references** | [**Array&lt;CustomsReferences&gt;**](CustomsReferences.md) |  | [optional] |
| **origin_booking_reference** | **String** | The identifier for a shipment | [optional] |
| **split_to_booking_references** | **Array&lt;String&gt;** |  | [optional] |
| **merge_to_booking_reference** | **String** | The identifier for a shipment | [optional] |
| **master_part_load_booking_reference** | **String** | The identifier for a shipment | [optional] |
| **part_load_group_booking_references** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::CarrierSpecificData.new(
  internal_event_code: XOF,
  internal_event_label: Load on Board,
  internal_location_code: FRMRS,
  internal_facility_code: FRMRSD2DT,
  booking_export_voyage_reference: NR145F8MA,
  transportation_phase: Export,
  shipment_location_type: POL,
  transport_call_sequence_total: 2,
  number_of_units: 1,
  customs_references: null,
  origin_booking_reference: d9c69bc8-294d-46d1-807c-654598341374,
  split_to_booking_references: null,
  merge_to_booking_reference: d9c69bc8-294d-46d1-807c-654598341374,
  master_part_load_booking_reference: d9c69bc8-294d-46d1-807c-654598341374,
  part_load_group_booking_references: null
)
```

