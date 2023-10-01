# CMACGMClient::InlineResponseDefault

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **http_method** | **Object** |  |  |
| **request_uri** | **Object** |  |  |
| **errors** | [**Array&lt;SubErrorsInner&gt;**](SubErrorsInner.md) |  |  |
| **status_code** | **Integer** | The HTTP status code |  |
| **status_code_text** | **String** | The textual representation of the response status. |  |
| **error_date_time** | **String** | The date and time (in ISO 8601 format) the error occurred. |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::InlineResponseDefault.new(
  http_method: GET,
  request_uri: https://dcsa.org/dcsa/tnt/v2/events,
  errors: null,
  status_code: 400,
  status_code_text: Bad Request,
  error_date_time: 2019-11-12T07:41:00+08:30
)
```

