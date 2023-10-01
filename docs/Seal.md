# CMACGMClient::Seal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **seal_number** | **String** | Identifies a seal affixed to the container. |  |
| **seal_source** | [**SealSource**](SealSource.md) |  | [optional] |
| **seal_type** | [**SealType**](SealType.md) |  |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::Seal.new(
  seal_number: null,
  seal_source: null,
  seal_type: null
)
```

