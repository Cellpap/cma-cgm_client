# CMACGMClient::ShipmentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_id** | **String** | The unique identifier for the event (the message - not the source). &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata | [optional] |
| **event_created_date_time** | **Time** | The timestamp of when the event was created. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |
| **event_type** | **String** |  |  |
| **event_classifier_code** | **String** | Code for the event classifier can be - ACT (Actual) - PLN (Planned) - EST (Estimated) |  |
| **event_date_time** | **Object** | Value for eventDateTime must be the same value as eventCreatedDateTime |  |
| **carrier_specific_data** | [**CarrierSpecificData**](CarrierSpecificData.md) |  | [optional] |
| **shipment_event_type_code** | [**ShipmentEventTypeCode**](ShipmentEventTypeCode.md) |  |  |
| **document_id** | **String** | The id of the object defined by the documentTypeCode. |  |
| **document_type_code** | [**DocumentTypeCode**](DocumentTypeCode.md) |  |  |
| **reason** | **String** | Reason field in a Shipment event. This field can be used to explain why a specific event has been sent. | [optional] |
| **shipment_id** | **String** | The identifier for a shipment | [optional] |
| **references** | [**Array&lt;Reference&gt;**](Reference.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::ShipmentEvent.new(
  event_id: 84db923d-2a19-4eb0-beb5-446c1ec57d34,
  event_created_date_time: 2021-01-09T14:12:56+01:00,
  event_type: SHIPMENT,
  event_classifier_code: ACT,
  event_date_time: null,
  carrier_specific_data: null,
  shipment_event_type_code: null,
  document_id: the-id-of-the-documentTypeCode,
  document_type_code: null,
  reason: The following attributes are missing...,
  shipment_id: d9c69bc8-294d-46d1-807c-654598341374,
  references: null
)
```

