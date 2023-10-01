# CMACGMClient::BaseEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_type** | **String** | The Event Type of the object - to be used as a discriminator. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |
| **event_classifier_code** | **String** | Code for the event classifier. Values can vary depending on eventType |  |
| **event_date_time** | **Time** | The local date and time, where the event took place or when the event will take place, in ISO 8601 format. |  |
| **carrier_specific_data** | [**CarrierSpecificData**](CarrierSpecificData.md) |  | [optional] |
| **event_id** | **String** | The unique identifier for the event (the message - not the source). &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata | [optional] |
| **event_created_date_time** | **Time** | The timestamp of when the event was created. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::BaseEvent.new(
  event_type: null,
  event_classifier_code: null,
  event_date_time: 2019-11-12T07:41+08:30,
  carrier_specific_data: null,
  event_id: 84db923d-2a19-4eb0-beb5-446c1ec57d34,
  event_created_date_time: 2021-01-09T14:12:56+01:00
)
```

