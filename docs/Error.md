# CMACGMClient::Error

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **http_method** | **String** | The HTTP request method type |  |
| **request_uri** | **String** | The request URI. |  |
| **errors** | [**Array&lt;SubErrorsInner&gt;**](SubErrorsInner.md) |  |  |
| **status_code** | **Integer** | The HTTP status code |  |
| **status_code_text** | **String** | The textual representation of the response status. |  |
| **error_date_time** | **String** | The date and time (in ISO 8601 format) the error occurred. |  |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::Error.new(
  http_method: POST,
  request_uri: https://dcsa.org/dcsa/tnt/v1/events,
  errors: null,
  status_code: 400,
  status_code_text: Bad Request,
  error_date_time: 2019-11-12T07:41:00+08:30
)
```

