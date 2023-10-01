# CMACGMClient::TransportCall

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transport_call_id** | **String** | The unique identifier for a transport call |  |
| **carrier_service_code** | **String** | The code of the service for which the schedule details are published. | [optional] |
| **carrier_voyage_number** | **Object** | The vessel operator-specific identifier of the Voyage. In case there are multiple voyages the export voyage is chosen. | [optional] |
| **export_voyage_number** | **String** | The vessel operator-specific identifier of the export Voyage. | [optional] |
| **import_voyage_number** | **String** | The vessel operator-specific identifier of the import Voyage. | [optional] |
| **transport_call_sequence_number** | **Integer** | Transport operator&amp;apos;s key that uniquely identifies each individual call. This key is essential to distinguish between two separate calls at the same location within one voyage. | [optional] |
| **un_location_code** | **String** | The UN Location code specifying where the place is located. | [optional] |
| **facility_code** | **String** | The code used for identifying the specific facility. This code does &lt;b&gt;not&lt;/b&gt; include the UN Location Code. | [optional] |
| **facility_code_list_provider** | [**FacilityCodeListProvider**](FacilityCodeListProvider.md) |  | [optional] |
| **facility_type_code** | [**FacilityTypeCodeTRN**](FacilityTypeCodeTRN.md) |  | [optional] |
| **other_facility** | **String** | An alternative way to capture the facility when no standardized DCSA facility code can be found. | [optional] |
| **mode_of_transport** | [**ModeOfTransport**](ModeOfTransport.md) |  |  |
| **location** | [**TransportCallAllOfLocation**](TransportCallAllOfLocation.md) |  | [optional] |
| **vessel** | [**Vessel**](Vessel.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::TransportCall.new(
  transport_call_id: 123e4567-e89b-12d3-a456-426614174000,
  carrier_service_code: FE1,
  carrier_voyage_number: null,
  export_voyage_number: 2103S,
  import_voyage_number: 2103N,
  transport_call_sequence_number: 2,
  un_location_code: FRPAR,
  facility_code: ADT,
  facility_code_list_provider: null,
  facility_type_code: null,
  other_facility: Depot location or address,
  mode_of_transport: null,
  location: null,
  vessel: null
)
```

