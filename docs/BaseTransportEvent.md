# CMACGMClient::BaseTransportEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_type** | **String** |  | [optional] |
| **event_classifier_code** | **String** | Code for the event classifier can be - ACT (Actual) - PLN (Planned) - EST (Estimated) | [optional] |
| **transport_event_type_code** | [**TransportEventTypeCode**](TransportEventTypeCode.md) |  |  |
| **delay_reason_code** | **String** | Reason code for the delay. The SMDG-Delay-Reason-Codes are used for this attribute. The code list can be found at http://www.smdg.org/smdg-code-lists/ | [optional] |
| **change_remark** | **String** | Free text information provided by the vessel operator regarding the reasons for the change in schedule and/or plans to mitigate schedule slippage. | [optional] |
| **transport_call** | [**TransportCall**](TransportCall.md) |  |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::BaseTransportEvent.new(
  event_type: TRANSPORT,
  event_classifier_code: ACT,
  transport_event_type_code: null,
  delay_reason_code: WEA,
  change_remark: Bad weather,
  transport_call: null
)
```

