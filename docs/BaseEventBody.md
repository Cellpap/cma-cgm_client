# CMACGMClient::BaseEventBody

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_type** | **String** | The Event Type of the object - to be used as a discriminator. &lt;b&gt;NB&lt;/b&gt;&amp;#58; This field should be considered Metadata |  |
| **event_classifier_code** | **String** | Code for the event classifier. Values can vary depending on eventType |  |
| **event_date_time** | **Time** | The local date and time, where the event took place or when the event will take place, in ISO 8601 format. |  |
| **carrier_specific_data** | [**CarrierSpecificData**](CarrierSpecificData.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::BaseEventBody.new(
  event_type: null,
  event_classifier_code: null,
  event_date_time: 2019-11-12T07:41+08:30,
  carrier_specific_data: null
)
```

