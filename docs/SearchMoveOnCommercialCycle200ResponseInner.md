# CMACGMClient::SearchMoveOnCommercialCycle200ResponseInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_id** | **String** | The unique identifier for the event (the message - not the source). &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata | [optional] |
| **event_created_date_time** | **Time** | The timestamp of when the event was created. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |
| **event_type** | **String** |  |  |
| **event_classifier_code** | **String** | Code for the event classifier can be - PLN (Planned) - ACT (Actual) - EST (Estimated) |  |
| **event_date_time** | **Time** | The local date and time, where the event took place or when the event will take place, in ISO 8601 format. |  |
| **carrier_specific_data** | [**CarrierSpecificData**](CarrierSpecificData.md) |  | [optional] |
| **transport_event_type_code** | [**TransportEventTypeCode**](TransportEventTypeCode.md) |  |  |
| **delay_reason_code** | **String** | Reason code for the delay. The SMDG-Delay-Reason-Codes are used for this attribute. The code list can be found at http://www.smdg.org/smdg-code-lists/ | [optional] |
| **change_remark** | **String** | Free text information provided by the vessel operator regarding the reasons for the change in schedule and/or plans to mitigate schedule slippage. | [optional] |
| **transport_call** | [**TransportCall**](TransportCall.md) |  |  |
| **document_references** | [**Array&lt;DocumentReferencesInner&gt;**](DocumentReferencesInner.md) | An optional list of key-value (documentReferenceType-documentReferenceValue) pairs representing links to objects relevant to the event. The &lt;b&gt;documentReferenceType&lt;/b&gt;-field is used to describe where the &lt;b&gt;documentReferenceValue&lt;/b&gt;-field is pointing to. | [optional] |
| **references** | [**Array&lt;Reference&gt;**](Reference.md) |  | [optional] |
| **shipment_event_type_code** | [**ShipmentEventTypeCode**](ShipmentEventTypeCode.md) |  |  |
| **document_id** | **String** | The id of the object defined by the documentTypeCode. |  |
| **document_type_code** | [**DocumentTypeCode**](DocumentTypeCode.md) |  |  |
| **reason** | **String** | Reason field in a Shipment event. This field can be used to explain why a specific event has been sent. | [optional] |
| **shipment_id** | **String** | The identifier for a shipment | [optional] |
| **equipment_event_type_code** | [**EquipmentEventTypeCode**](EquipmentEventTypeCode.md) |  |  |
| **equipment_reference** | **String** | The unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. According to ISO 6346, a container identification code consists of a 4-letter prefix and a 7-digit number (composed of a 3-letter owner code, a category identifier, a serial number, and a check-digit). If a container does not comply with ISO 6346, it is suggested to follow Recommendation | [optional] |
| **iso_equipment_code** | **String** | Unique code for the different equipment size/type used for transporting commodities. The code is a concatenation of ISO Equipment Size Code and ISO Equipment Type Code A and follows the ISO 6346 standard. | [optional] |
| **empty_indicator_code** | [**EmptyIndicatorCode**](EmptyIndicatorCode.md) |  |  |
| **event_location** | [**Location**](Location.md) |  | [optional] |
| **seals** | [**Array&lt;Seal&gt;**](Seal.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::SearchMoveOnCommercialCycle200ResponseInner.new(
  event_id: 84db923d-2a19-4eb0-beb5-446c1ec57d34,
  event_created_date_time: 2021-01-09T14:12:56+01:00,
  event_type: EQUIPMENT,
  event_classifier_code: EST,
  event_date_time: 2019-11-12T07:41+08:30,
  carrier_specific_data: null,
  transport_event_type_code: null,
  delay_reason_code: WEA,
  change_remark: Bad weather,
  transport_call: null,
  document_references: [{&quot;documentReferenceType&quot;:&quot;BKG&quot;,&quot;documentReferenceValue&quot;:&quot;ABC123123123&quot;},{&quot;documentReferenceType&quot;:&quot;TRD&quot;,&quot;documentReferenceValue&quot;:&quot;85943567-eedb-98d3-f4ed-aed697474ed4&quot;}],
  references: null,
  shipment_event_type_code: null,
  document_id: the-id-of-the-documentTypeCode,
  document_type_code: null,
  reason: The following attributes are missing...,
  shipment_id: d9c69bc8-294d-46d1-807c-654598341374,
  equipment_event_type_code: null,
  equipment_reference: APZU4812090,
  iso_equipment_code: 22GP,
  empty_indicator_code: null,
  event_location: null,
  seals: null
)
```

