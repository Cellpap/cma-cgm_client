# CMACGMClient::SubErrorsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | High level error message. |  |
| **message** | **String** | Detailed error message. |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::SubErrorsInner.new(
  reason: invalidQuery,
  message: The request did not contain one of the three required query parameters.
)
```

