# CMACGMClient::Location

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **location_name** | **String** | The name of the location. | [optional] |
| **latitude** | **String** | Geographic coordinate that specifies the north–south position of a point on the Earth&amp;apos;s surface. | [optional] |
| **longitude** | **String** | Geographic coordinate that specifies the east–west position of a point on the Earth&amp;apos;s surface. | [optional] |
| **un_location_code** | **String** | The UN Location code specifying where the place is located. | [optional] |
| **address** | [**Address**](Address.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::Location.new(
  location_name: Eiffel Tower,
  latitude: 48.8585500,
  longitude: 2.294492036,
  un_location_code: FRPAR,
  address: null
)
```

