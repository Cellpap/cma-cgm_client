# CMACGMClient::TransportEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_id** | **String** | The unique identifier for the event (the message - not the source). &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata | [optional] |
| **event_created_date_time** | **Time** | The timestamp of when the event was created. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |
| **event_type** | **String** |  |  |
| **event_classifier_code** | **String** | Code for the event classifier can be - ACT (Actual) - PLN (Planned) - EST (Estimated) |  |
| **event_date_time** | **Time** | The local date and time, where the event took place or when the event will take place, in ISO 8601 format. |  |
| **carrier_specific_data** | [**CarrierSpecificData**](CarrierSpecificData.md) |  | [optional] |
| **transport_event_type_code** | [**TransportEventTypeCode**](TransportEventTypeCode.md) |  |  |
| **delay_reason_code** | **String** | Reason code for the delay. The SMDG-Delay-Reason-Codes are used for this attribute. The code list can be found at http://www.smdg.org/smdg-code-lists/ | [optional] |
| **change_remark** | **String** | Free text information provided by the vessel operator regarding the reasons for the change in schedule and/or plans to mitigate schedule slippage. | [optional] |
| **transport_call** | [**TransportCall**](TransportCall.md) |  |  |
| **references** | [**Array&lt;Reference&gt;**](Reference.md) |  | [optional] |
| **document_references** | [**Array&lt;DocumentReferencesInner&gt;**](DocumentReferencesInner.md) | An optional list of key-value (documentReferenceType-documentReferenceValue) pairs representing links to objects relevant to the event. The &lt;b&gt;documentReferenceType&lt;/b&gt;-field is used to describe where the &lt;b&gt;documentReferenceValue&lt;/b&gt;-field is pointing to. | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::TransportEvent.new(
  event_id: 84db923d-2a19-4eb0-beb5-446c1ec57d34,
  event_created_date_time: 2021-01-09T14:12:56+01:00,
  event_type: TRANSPORT,
  event_classifier_code: ACT,
  event_date_time: 2019-11-12T07:41+08:30,
  carrier_specific_data: null,
  transport_event_type_code: null,
  delay_reason_code: WEA,
  change_remark: Bad weather,
  transport_call: null,
  references: null,
  document_references: [{&quot;documentReferenceType&quot;:&quot;BKG&quot;,&quot;documentReferenceValue&quot;:&quot;ABC123123123&quot;},{&quot;documentReferenceType&quot;:&quot;TRD&quot;,&quot;documentReferenceValue&quot;:&quot;85943567-eedb-98d3-f4ed-aed697474ed4&quot;}]
)
```

