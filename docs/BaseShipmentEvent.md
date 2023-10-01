# CMACGMClient::BaseShipmentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **references** | [**Array&lt;Reference&gt;**](Reference.md) |  | [optional] |
| **event_type** | **String** |  | [optional] |
| **event_date_time** | **Object** | Value for eventDateTime must be the same value as eventCreatedDateTime | [optional] |
| **event_classifier_code** | **String** | Code for the event classifier can be - ACT (Actual) - PLN (Planned) - EST (Estimated) | [optional] |
| **shipment_event_type_code** | [**ShipmentEventTypeCode**](ShipmentEventTypeCode.md) |  |  |
| **document_id** | **String** | The id of the object defined by the documentTypeCode. |  |
| **document_type_code** | [**DocumentTypeCode**](DocumentTypeCode.md) |  |  |
| **reason** | **String** | Reason field in a Shipment event. This field can be used to explain why a specific event has been sent. | [optional] |
| **shipment_id** | **String** | The identifier for a shipment | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::BaseShipmentEvent.new(
  references: null,
  event_type: SHIPMENT,
  event_date_time: null,
  event_classifier_code: ACT,
  shipment_event_type_code: null,
  document_id: the-id-of-the-documentTypeCode,
  document_type_code: null,
  reason: The following attributes are missing...,
  shipment_id: d9c69bc8-294d-46d1-807c-654598341374
)
```

