# CMACGMClient::DocumentReferencesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_reference_type** | **String** | Describes where the documentReferenceValue is pointing to | [optional] |
| **document_reference_value** | **String** | The value of the identifier the documentReferenceType is describing | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::DocumentReferencesInner.new(
  document_reference_type: BKG,
  document_reference_value: 123e4567-e89b-12d3-a456-426614174000
)
```

