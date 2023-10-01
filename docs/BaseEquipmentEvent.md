# CMACGMClient::BaseEquipmentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **references** | [**Array&lt;Reference&gt;**](Reference.md) |  | [optional] |
| **seals** | [**Array&lt;Seal&gt;**](Seal.md) |  | [optional] |
| **event_type** | **String** |  | [optional] |
| **event_classifier_code** | **String** | Code for the event classifier can be - PLN (Planned) - ACT (Actual) - EST (Estimated) | [optional] |
| **equipment_event_type_code** | [**EquipmentEventTypeCode**](EquipmentEventTypeCode.md) |  |  |
| **equipment_reference** | **String** | The unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. According to ISO 6346, a container identification code consists of a 4-letter prefix and a 7-digit number (composed of a 3-letter owner code, a category identifier, a serial number, and a check-digit). If a container does not comply with ISO 6346, it is suggested to follow Recommendation | [optional] |
| **iso_equipment_code** | **String** | Unique code for the different equipment size/type used for transporting commodities. The code is a concatenation of ISO Equipment Size Code and ISO Equipment Type Code A and follows the ISO 6346 standard. | [optional] |
| **empty_indicator_code** | [**EmptyIndicatorCode**](EmptyIndicatorCode.md) |  |  |
| **event_location** | [**Location**](Location.md) |  | [optional] |
| **transport_call** | [**TransportCall**](TransportCall.md) |  | [optional] |
| **document_references** | [**Array&lt;DocumentReferencesInner&gt;**](DocumentReferencesInner.md) | An optional list of key-value (documentReferenceType-documentReferenceValue) pairs representing links to objects relevant to the event. The &lt;b&gt;documentReferenceType&lt;/b&gt;-field is used to describe where the &lt;b&gt;documentReferenceValue&lt;/b&gt;-field is pointing to. | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::BaseEquipmentEvent.new(
  references: null,
  seals: null,
  event_type: EQUIPMENT,
  event_classifier_code: EST,
  equipment_event_type_code: null,
  equipment_reference: APZU4812090,
  iso_equipment_code: 22GP,
  empty_indicator_code: null,
  event_location: null,
  transport_call: null,
  document_references: [{&quot;documentReferenceType&quot;:&quot;BKG&quot;,&quot;documentReferenceValue&quot;:&quot;ABC123123123&quot;},{&quot;documentReferenceType&quot;:&quot;TRD&quot;,&quot;documentReferenceValue&quot;:&quot;85943567-eedb-98d3-f4ed-aed697474ed4&quot;}]
)
```

