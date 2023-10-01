# CMACGMClient::EventsApi

All URIs are relative to *https://apis.cma-cgm.net/operation/trackandtrace/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_move_on_commercial_cycle**](EventsApi.md#get_move_on_commercial_cycle) | **GET** /events/{trackingReference} | Find Commercial events from unique tracking greference. |
| [**search_move_on_commercial_cycle**](EventsApi.md#search_move_on_commercial_cycle) | **GET** /events | Find Commercial events. |


## get_move_on_commercial_cycle

> <Array<SearchMoveOnCommercialCycle200ResponseInner>> get_move_on_commercial_cycle(tracking_reference, opts)

Find Commercial events from unique tracking greference.

Return commercial cycle belonging to provided tracking reference <b>Query is not DCSA compliant but Return data follow DCSA TNT 2.2.0 specifications</b>

### Examples

```ruby
require 'time'
require 'cmacgm_client'
# setup authorization
CMACGMClient.configure do |config|
  # Configure API key authorization: ApiKeyAuth
  config.api_key['ApiKeyAuth'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKeyAuth'] = 'Bearer'

  # Configure OAuth2 access token for authorization: oAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = CMACGMClient::EventsApi.new
tracking_reference = 'tracking_reference_example' # String | Shipment reference or Equipment identifier
opts = {
  behalf_of: '00002334567', # String | (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code
  limit: 100, # Integer | Maximum number of items to return.
  cursor: 'fE9mZnNldHw9MTAmbGltaXQ9MTA=' # String | A server generated value to specify a specific point in a collection result, used for pagination.
}

begin
  # Find Commercial events from unique tracking greference.
  result = api_instance.get_move_on_commercial_cycle(tracking_reference, opts)
  p result
rescue CMACGMClient::ApiError => e
  puts "Error when calling EventsApi->get_move_on_commercial_cycle: #{e}"
end
```

#### Using the get_move_on_commercial_cycle_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<SearchMoveOnCommercialCycle200ResponseInner>>, Integer, Hash)> get_move_on_commercial_cycle_with_http_info(tracking_reference, opts)

```ruby
begin
  # Find Commercial events from unique tracking greference.
  data, status_code, headers = api_instance.get_move_on_commercial_cycle_with_http_info(tracking_reference, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<SearchMoveOnCommercialCycle200ResponseInner>>
rescue CMACGMClient::ApiError => e
  puts "Error when calling EventsApi->get_move_on_commercial_cycle_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_reference** | **String** | Shipment reference or Equipment identifier |  |
| **behalf_of** | **String** | (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code | [optional] |
| **limit** | **Integer** | Maximum number of items to return. | [optional][default to 100] |
| **cursor** | **String** | A server generated value to specify a specific point in a collection result, used for pagination. | [optional] |

### Return type

[**Array&lt;SearchMoveOnCommercialCycle200ResponseInner&gt;**](SearchMoveOnCommercialCycle200ResponseInner.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [oAuth2](../README.md#oAuth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_move_on_commercial_cycle

> <Array<SearchMoveOnCommercialCycle200ResponseInner>> search_move_on_commercial_cycle(opts)

Find Commercial events.

Returns all events filtered by the queryParameters. <b>NB</b>&#58; It is possible to combine queryParameters. When combining queryParameters be aware that it is also possible to make combinations that are mutual contradicting. Example&#58; <i>shipmentEventTypeCode=DRFT and equipmentEventTypeCode=GTIN</i> Since there is no event that can be a ShipmentEvent <u>and</u> an EquipmentEvent at the same time <b>this will return an empty list</b>! <b>Follow DCSA TNT 2.2.0 specifications</b>

### Examples

```ruby
require 'time'
require 'cmacgm_client'
# setup authorization
CMACGMClient.configure do |config|
  # Configure API key authorization: ApiKeyAuth
  config.api_key['ApiKeyAuth'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['ApiKeyAuth'] = 'Bearer'

  # Configure OAuth2 access token for authorization: oAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = CMACGMClient::EventsApi.new
opts = {
  event_type: ['SHIPMENT'], # Array<String> | The type of event(s) to filter by. Possible values are - SHIPMENT (Shipment events) - TRANSPORT (Transport events) - EQUIPMENT (Equipment events) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example eventType=SHIPMENT,EQUIPMENT matches both Shipment- and Equipment-events. Default value is all event types.
  shipment_event_type_code: [CMACGMClient::ShipmentEventTypeCode::RECE], # Array<ShipmentEventTypeCode> | The status of the document in the process to filter by. Possible values are - RECE (Received) - DRFT (Drafted) - PENA (Pending Approval) - PENU (Pending Update) - REJE (Rejected) - APPR (Approved) - ISSU (Issued) - SURR (Surrendered) - SUBM (Submitted) - VOID (Void) - CONF (Confirmed) - REQS (Requested) - CMPL (Completed) - HOLD (On Hold) - RELS (Released) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example <i>shipmentEventTypeCode=RECE,DRFT</i>  Matches <b>both</b> Received (RECE) and Drafted (DRFT) shipment events. Default is all shipmentEventTypeCodes. This filter is only relevant when filtering on ShipmentEvents
  document_type_code: [CMACGMClient::DocumentTypeCode::CBR], # Array<DocumentTypeCode> | The documentTypeCode to filter by. Possible values are - CBR (Carrier Booking Request Reference) - BKG (Booking) - SHI (Shipping Instruction) - SRM (Shipment Release Message) - TRD (Transport Document) - ARN (Arrival Notice) - VGM (Verified Gross Mass) - CAS (Cargo Survey) - CUS (Customs Inspection) - DGD (Dangerous Goods Declaration) - OOG (Out of Gauge) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example <i>documentTypeCode=SHI,TRD</i> Matches <b>both</b> ShippingInstruction (SHI) and TransportDocument (TRD) shipment events. Default is all documentTypeCodes. This filter is only relevant when filtering on ShipmentEvents
  carrier_booking_reference: 'carrier_booking_reference_example', # String | A set of unique characters provided by carrier to identify a booking. Specifying this filter will only return events related to this particular carrierBookingReference.
  transport_document_reference: 'transport_document_reference_example', # String | A unique number reference allocated by the shipping line to the transport document and the main number used for the tracking of the status of the shipment. Specifying this filter will only return events related to this particular transportDocumentReference
  transport_event_type_code: [CMACGMClient::TransportEventTypeCode::ARRI], # Array<TransportEventTypeCode> | Identifier for type of Transport event to filter by - ARRI (Arrived) - DEPA (Departed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example <i>transportEventTypeCode=ARRI,DEPA</i> matches <b>both</b> Arrived (ARRI) and Departed (DEPA) transport events. Default is all transportEventTypeCodes. This filter is only relevant when filtering on TransportEvents
  transport_call_id: 'transport_call_id_example', # String | ID uniquely identifying a transport call, to filter events by. Specifying this filter will only return events related to this particular transportCallID
  vessel_imo_number: 'vessel_imo_number_example', # String | The identifier of vessel for which schedule details are published. Depending on schedule type, this may not be available yet. Specifying this filter will only return events related to this particular vesselIMONumber.
  export_voyage_number: 'export_voyage_number_example', # String | Filter on the vessel operator-specific identifier of the export Voyage. Specifying this filter will only return events related to this particular exportVoyageNumber.
  carrier_service_code: 'carrier_service_code_example', # String | Filter on the carrier specific identifier of the service. Specifying this filter will only return events related to this particular carrierServiceCode.
  un_location_code: 'un_location_code_example', # String | The UN Location code specifying where the place is located. Specifying this filter will only return events related to this particular UN Location code.
  equipment_event_type_code: [CMACGMClient::EquipmentEventTypeCode::LOAD], # Array<EquipmentEventTypeCode> | Unique identifier for equipmentEventTypeCode. - LOAD (Loaded) - DISC (Discharged) - GTIN (Gated in) - GTOT (Gated out) - STUF (Stuffed) - STRP (Stripped) - PICK (Pick-up) - DROP (Drop-off) - INSP (Inspected) - RSEA (Resealed) - RMVD (Removed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example <i>equipmentEventTypeCode=GTIN,GTOT</i> matches <b>both</b> Gated in (GTIN) and Gated out (GTOT) equipment events. Default is all equipmentEventTypeCodes. This filter is only relevant when filtering on EquipmentEvents
  equipment_reference: 'equipment_reference_example', # String | Will filter by the unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. Specifying this filter will only return events related to this particular equipmentReference
  event_created_date_time: Time.parse('2021-04-01T14:12:56+01:00'), # Time | Limit the result based on the creating date of the event. It is possible to use operators on this query parameter. This is done by adding a colon followed by an operator at the end of the queryParameterName (before the =) <i>eventCreatedDateTime<b>&#58;gte</b>=2021-04-01T14&#58;12&#58;56+01&#58;00</i> would result in all events created &#8805; 2021-04-01T14&#58;12&#58;56+01&#58;00 The following operators are supported - &#58;gte (&#8805; Greater than or equal) - &#58;gt (&#62; Greater than) - &#58;lte (&#8804; Less than or equal) - &#58;lt (&#60; Less than) - &#58;eq (&#61; Equal to) If no operator is provided, a <b>strictly equal</b> is used (this is equivalent to <b>&#58;eq</b> operator).
  event_date_time: Time.parse('2021-04-01T14:12:56+01:00'), # Time | not DCSA - when search is done by container reference , allow to search the last container cycle happening before the provided date
  behalf_of: '00002334567', # String | (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code -- Not a standard DCSA attribute
  limit: 100, # Integer | Maximum number of items to return.
  cursor: 'fE9mZnNldHw9MTAmbGltaXQ9MTA=' # String | A server generated value to specify a specific point in a collection result, used for pagination.
}

begin
  # Find Commercial events.
  result = api_instance.search_move_on_commercial_cycle(opts)
  p result
rescue CMACGMClient::ApiError => e
  puts "Error when calling EventsApi->search_move_on_commercial_cycle: #{e}"
end
```

#### Using the search_move_on_commercial_cycle_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<SearchMoveOnCommercialCycle200ResponseInner>>, Integer, Hash)> search_move_on_commercial_cycle_with_http_info(opts)

```ruby
begin
  # Find Commercial events.
  data, status_code, headers = api_instance.search_move_on_commercial_cycle_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<SearchMoveOnCommercialCycle200ResponseInner>>
rescue CMACGMClient::ApiError => e
  puts "Error when calling EventsApi->search_move_on_commercial_cycle_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_type** | [**Array&lt;String&gt;**](String.md) | The type of event(s) to filter by. Possible values are - SHIPMENT (Shipment events) - TRANSPORT (Transport events) - EQUIPMENT (Equipment events) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example eventType&#x3D;SHIPMENT,EQUIPMENT matches both Shipment- and Equipment-events. Default value is all event types. | [optional] |
| **shipment_event_type_code** | [**Array&lt;ShipmentEventTypeCode&gt;**](ShipmentEventTypeCode.md) | The status of the document in the process to filter by. Possible values are - RECE (Received) - DRFT (Drafted) - PENA (Pending Approval) - PENU (Pending Update) - REJE (Rejected) - APPR (Approved) - ISSU (Issued) - SURR (Surrendered) - SUBM (Submitted) - VOID (Void) - CONF (Confirmed) - REQS (Requested) - CMPL (Completed) - HOLD (On Hold) - RELS (Released) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;shipmentEventTypeCode&#x3D;RECE,DRFT&lt;/i&gt;  Matches &lt;b&gt;both&lt;/b&gt; Received (RECE) and Drafted (DRFT) shipment events. Default is all shipmentEventTypeCodes. This filter is only relevant when filtering on ShipmentEvents | [optional] |
| **document_type_code** | [**Array&lt;DocumentTypeCode&gt;**](DocumentTypeCode.md) | The documentTypeCode to filter by. Possible values are - CBR (Carrier Booking Request Reference) - BKG (Booking) - SHI (Shipping Instruction) - SRM (Shipment Release Message) - TRD (Transport Document) - ARN (Arrival Notice) - VGM (Verified Gross Mass) - CAS (Cargo Survey) - CUS (Customs Inspection) - DGD (Dangerous Goods Declaration) - OOG (Out of Gauge) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;documentTypeCode&#x3D;SHI,TRD&lt;/i&gt; Matches &lt;b&gt;both&lt;/b&gt; ShippingInstruction (SHI) and TransportDocument (TRD) shipment events. Default is all documentTypeCodes. This filter is only relevant when filtering on ShipmentEvents | [optional] |
| **carrier_booking_reference** | **String** | A set of unique characters provided by carrier to identify a booking. Specifying this filter will only return events related to this particular carrierBookingReference. | [optional] |
| **transport_document_reference** | **String** | A unique number reference allocated by the shipping line to the transport document and the main number used for the tracking of the status of the shipment. Specifying this filter will only return events related to this particular transportDocumentReference | [optional] |
| **transport_event_type_code** | [**Array&lt;TransportEventTypeCode&gt;**](TransportEventTypeCode.md) | Identifier for type of Transport event to filter by - ARRI (Arrived) - DEPA (Departed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;transportEventTypeCode&#x3D;ARRI,DEPA&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Arrived (ARRI) and Departed (DEPA) transport events. Default is all transportEventTypeCodes. This filter is only relevant when filtering on TransportEvents | [optional] |
| **transport_call_id** | **String** | ID uniquely identifying a transport call, to filter events by. Specifying this filter will only return events related to this particular transportCallID | [optional] |
| **vessel_imo_number** | **String** | The identifier of vessel for which schedule details are published. Depending on schedule type, this may not be available yet. Specifying this filter will only return events related to this particular vesselIMONumber. | [optional] |
| **export_voyage_number** | **String** | Filter on the vessel operator-specific identifier of the export Voyage. Specifying this filter will only return events related to this particular exportVoyageNumber. | [optional] |
| **carrier_service_code** | **String** | Filter on the carrier specific identifier of the service. Specifying this filter will only return events related to this particular carrierServiceCode. | [optional] |
| **un_location_code** | **String** | The UN Location code specifying where the place is located. Specifying this filter will only return events related to this particular UN Location code. | [optional] |
| **equipment_event_type_code** | [**Array&lt;EquipmentEventTypeCode&gt;**](EquipmentEventTypeCode.md) | Unique identifier for equipmentEventTypeCode. - LOAD (Loaded) - DISC (Discharged) - GTIN (Gated in) - GTOT (Gated out) - STUF (Stuffed) - STRP (Stripped) - PICK (Pick-up) - DROP (Drop-off) - INSP (Inspected) - RSEA (Resealed) - RMVD (Removed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;equipmentEventTypeCode&#x3D;GTIN,GTOT&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Gated in (GTIN) and Gated out (GTOT) equipment events. Default is all equipmentEventTypeCodes. This filter is only relevant when filtering on EquipmentEvents | [optional] |
| **equipment_reference** | **String** | Will filter by the unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. Specifying this filter will only return events related to this particular equipmentReference | [optional] |
| **event_created_date_time** | **Time** | Limit the result based on the creating date of the event. It is possible to use operators on this query parameter. This is done by adding a colon followed by an operator at the end of the queryParameterName (before the &#x3D;) &lt;i&gt;eventCreatedDateTime&lt;b&gt;&amp;#58;gte&lt;/b&gt;&#x3D;2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00&lt;/i&gt; would result in all events created &amp;#8805; 2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00 The following operators are supported - &amp;#58;gte (&amp;#8805; Greater than or equal) - &amp;#58;gt (&amp;#62; Greater than) - &amp;#58;lte (&amp;#8804; Less than or equal) - &amp;#58;lt (&amp;#60; Less than) - &amp;#58;eq (&amp;#61; Equal to) If no operator is provided, a &lt;b&gt;strictly equal&lt;/b&gt; is used (this is equivalent to &lt;b&gt;&amp;#58;eq&lt;/b&gt; operator). | [optional] |
| **event_date_time** | **Time** | not DCSA - when search is done by container reference , allow to search the last container cycle happening before the provided date | [optional] |
| **behalf_of** | **String** | (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code -- Not a standard DCSA attribute | [optional] |
| **limit** | **Integer** | Maximum number of items to return. | [optional][default to 100] |
| **cursor** | **String** | A server generated value to specify a specific point in a collection result, used for pagination. | [optional] |

### Return type

[**Array&lt;SearchMoveOnCommercialCycle200ResponseInner&gt;**](SearchMoveOnCommercialCycle200ResponseInner.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [oAuth2](../README.md#oAuth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

