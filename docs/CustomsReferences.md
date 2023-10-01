# CMACGMClient::CustomsReferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **equipment_reference** | **String** | The unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. According to ISO 6346, a container identification code consists of a 4-letter prefix and a 7-digit number (composed of a 3-letter owner code, a category identifier, a serial number, and a check-digit). If a container does not comply with ISO 6346, it is suggested to follow Recommendation | [optional] |
| **customs_reference** | **String** | the customs reference for the container | [optional] |
| **reference_date** | **Date** | the customs reference date | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::CustomsReferences.new(
  equipment_reference: APZU4812090,
  customs_reference: ATB12345687493994,
  reference_date: Sun May 01 05:30:00 IST 2022
)
```

