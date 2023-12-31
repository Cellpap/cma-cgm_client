=begin
#Logistic Tracking service API - DCSA OpenAPI specification for Track & Trace v2.2.0

#Managing and sending Shipment-, Transport- and Equipment-events and subscriptions for Track &amp; Trace (T&amp;T). API specification issued by DCSA.org.  <i>Please note that shipment events and subscription management are not covered yet by CMA CGM API.</i>  <br> This API is accessible through <ul> <li> <b> Public </b> connection (authentication with API Key): this allows to retrieve standard equipment moves (e.g. ready to be loaded, discharged), Transhipment moves (e.g. discharged and re-loaded onboard) and planned vessel departure and arrival dates. </li> <li> <b> Private </b> connection (authentication with Oauth2 client credentials): this allows to retrieve additional private events such as actual rail and ramp moves, planned departure and arrival dates for inland moves. These private events are available only if you (or your end customer) are identified on the booking as: Booking Party, Deciding Party, Consignee, Notifier or Shipper. </li> </ul> </br> For explanation to specific values or objects please refer to the <a href='https://dcsa.org/wp-content/uploads/2021/10/202108_DCSA_P1_Information-Model-v3.3_TNT22_Final.pdf'>Information Model v3.3</a> Polling can be done on the <b>GET /events</b> endPoint. DCSA version 2.2.0

The version of the OpenAPI document: 2.2.4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'cgi'

module CMACGMClient
  class EventsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Find Commercial events from unique tracking greference.
    # Return commercial cycle belonging to provided tracking reference <b>Query is not DCSA compliant but Return data follow DCSA TNT 2.2.0 specifications</b>
    # @param tracking_reference [String] Shipment reference or Equipment identifier
    # @param [Hash] opts the optional parameters
    # @option opts [String] :behalf_of (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code
    # @option opts [Integer] :limit Maximum number of items to return. (default to 100)
    # @option opts [String] :cursor A server generated value to specify a specific point in a collection result, used for pagination.
    # @return [Array<SearchMoveOnCommercialCycle200ResponseInner>]
    def get_move_on_commercial_cycle(tracking_reference, opts = {})
      data, _status_code, _headers = get_move_on_commercial_cycle_with_http_info(tracking_reference, opts)
      data
    end

    # Find Commercial events from unique tracking greference.
    # Return commercial cycle belonging to provided tracking reference &lt;b&gt;Query is not DCSA compliant but Return data follow DCSA TNT 2.2.0 specifications&lt;/b&gt;
    # @param tracking_reference [String] Shipment reference or Equipment identifier
    # @param [Hash] opts the optional parameters
    # @option opts [String] :behalf_of (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code
    # @option opts [Integer] :limit Maximum number of items to return. (default to 100)
    # @option opts [String] :cursor A server generated value to specify a specific point in a collection result, used for pagination.
    # @return [Array<(Array<SearchMoveOnCommercialCycle200ResponseInner>, Integer, Hash)>] Array<SearchMoveOnCommercialCycle200ResponseInner> data, response status code and response headers
    def get_move_on_commercial_cycle_with_http_info(tracking_reference, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_move_on_commercial_cycle ...'
      end
      # verify the required parameter 'tracking_reference' is set
      if @api_client.config.client_side_validation && tracking_reference.nil?
        fail ArgumentError, "Missing the required parameter 'tracking_reference' when calling EventsApi.get_move_on_commercial_cycle"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling EventsApi.get_move_on_commercial_cycle, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/events/{trackingReference}'.sub('{' + 'trackingReference' + '}', CGI.escape(tracking_reference.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'behalfOf'] = opts[:'behalf_of'] if !opts[:'behalf_of'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<SearchMoveOnCommercialCycle200ResponseInner>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth', 'oAuth2']

      new_options = opts.merge(
        :operation => :"EventsApi.get_move_on_commercial_cycle",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_move_on_commercial_cycle\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find Commercial events.
    # Returns all events filtered by the queryParameters. <b>NB</b>&#58; It is possible to combine queryParameters. When combining queryParameters be aware that it is also possible to make combinations that are mutual contradicting. Example&#58; <i>shipmentEventTypeCode=DRFT and equipmentEventTypeCode=GTIN</i> Since there is no event that can be a ShipmentEvent <u>and</u> an EquipmentEvent at the same time <b>this will return an empty list</b>! <b>Follow DCSA TNT 2.2.0 specifications</b>
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :event_type The type of event(s) to filter by. Possible values are - SHIPMENT (Shipment events) - TRANSPORT (Transport events) - EQUIPMENT (Equipment events) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example eventType&#x3D;SHIPMENT,EQUIPMENT matches both Shipment- and Equipment-events. Default value is all event types.
    # @option opts [Array<ShipmentEventTypeCode>] :shipment_event_type_code The status of the document in the process to filter by. Possible values are - RECE (Received) - DRFT (Drafted) - PENA (Pending Approval) - PENU (Pending Update) - REJE (Rejected) - APPR (Approved) - ISSU (Issued) - SURR (Surrendered) - SUBM (Submitted) - VOID (Void) - CONF (Confirmed) - REQS (Requested) - CMPL (Completed) - HOLD (On Hold) - RELS (Released) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;shipmentEventTypeCode&#x3D;RECE,DRFT&lt;/i&gt;  Matches &lt;b&gt;both&lt;/b&gt; Received (RECE) and Drafted (DRFT) shipment events. Default is all shipmentEventTypeCodes. This filter is only relevant when filtering on ShipmentEvents
    # @option opts [Array<DocumentTypeCode>] :document_type_code The documentTypeCode to filter by. Possible values are - CBR (Carrier Booking Request Reference) - BKG (Booking) - SHI (Shipping Instruction) - SRM (Shipment Release Message) - TRD (Transport Document) - ARN (Arrival Notice) - VGM (Verified Gross Mass) - CAS (Cargo Survey) - CUS (Customs Inspection) - DGD (Dangerous Goods Declaration) - OOG (Out of Gauge) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;documentTypeCode&#x3D;SHI,TRD&lt;/i&gt; Matches &lt;b&gt;both&lt;/b&gt; ShippingInstruction (SHI) and TransportDocument (TRD) shipment events. Default is all documentTypeCodes. This filter is only relevant when filtering on ShipmentEvents
    # @option opts [String] :carrier_booking_reference A set of unique characters provided by carrier to identify a booking. Specifying this filter will only return events related to this particular carrierBookingReference.
    # @option opts [String] :transport_document_reference A unique number reference allocated by the shipping line to the transport document and the main number used for the tracking of the status of the shipment. Specifying this filter will only return events related to this particular transportDocumentReference
    # @option opts [Array<TransportEventTypeCode>] :transport_event_type_code Identifier for type of Transport event to filter by - ARRI (Arrived) - DEPA (Departed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;transportEventTypeCode&#x3D;ARRI,DEPA&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Arrived (ARRI) and Departed (DEPA) transport events. Default is all transportEventTypeCodes. This filter is only relevant when filtering on TransportEvents
    # @option opts [String] :transport_call_id ID uniquely identifying a transport call, to filter events by. Specifying this filter will only return events related to this particular transportCallID
    # @option opts [String] :vessel_imo_number The identifier of vessel for which schedule details are published. Depending on schedule type, this may not be available yet. Specifying this filter will only return events related to this particular vesselIMONumber.
    # @option opts [String] :export_voyage_number Filter on the vessel operator-specific identifier of the export Voyage. Specifying this filter will only return events related to this particular exportVoyageNumber.
    # @option opts [String] :carrier_service_code Filter on the carrier specific identifier of the service. Specifying this filter will only return events related to this particular carrierServiceCode.
    # @option opts [String] :un_location_code The UN Location code specifying where the place is located. Specifying this filter will only return events related to this particular UN Location code.
    # @option opts [Array<EquipmentEventTypeCode>] :equipment_event_type_code Unique identifier for equipmentEventTypeCode. - LOAD (Loaded) - DISC (Discharged) - GTIN (Gated in) - GTOT (Gated out) - STUF (Stuffed) - STRP (Stripped) - PICK (Pick-up) - DROP (Drop-off) - INSP (Inspected) - RSEA (Resealed) - RMVD (Removed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;equipmentEventTypeCode&#x3D;GTIN,GTOT&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Gated in (GTIN) and Gated out (GTOT) equipment events. Default is all equipmentEventTypeCodes. This filter is only relevant when filtering on EquipmentEvents
    # @option opts [String] :equipment_reference Will filter by the unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. Specifying this filter will only return events related to this particular equipmentReference
    # @option opts [Time] :event_created_date_time Limit the result based on the creating date of the event. It is possible to use operators on this query parameter. This is done by adding a colon followed by an operator at the end of the queryParameterName (before the &#x3D;) &lt;i&gt;eventCreatedDateTime&lt;b&gt;&amp;#58;gte&lt;/b&gt;&#x3D;2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00&lt;/i&gt; would result in all events created &amp;#8805; 2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00 The following operators are supported - &amp;#58;gte (&amp;#8805; Greater than or equal) - &amp;#58;gt (&amp;#62; Greater than) - &amp;#58;lte (&amp;#8804; Less than or equal) - &amp;#58;lt (&amp;#60; Less than) - &amp;#58;eq (&amp;#61; Equal to) If no operator is provided, a &lt;b&gt;strictly equal&lt;/b&gt; is used (this is equivalent to &lt;b&gt;&amp;#58;eq&lt;/b&gt; operator).
    # @option opts [Time] :event_date_time not DCSA - when search is done by container reference , allow to search the last container cycle happening before the provided date
    # @option opts [String] :behalf_of (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code -- Not a standard DCSA attribute
    # @option opts [Integer] :limit Maximum number of items to return. (default to 100)
    # @option opts [String] :cursor A server generated value to specify a specific point in a collection result, used for pagination.
    # @return [Array<SearchMoveOnCommercialCycle200ResponseInner>]
    def search_move_on_commercial_cycle(opts = {})
      data, _status_code, _headers = search_move_on_commercial_cycle_with_http_info(opts)
      data
    end

    # Find Commercial events.
    # Returns all events filtered by the queryParameters. &lt;b&gt;NB&lt;/b&gt;&amp;#58; It is possible to combine queryParameters. When combining queryParameters be aware that it is also possible to make combinations that are mutual contradicting. Example&amp;#58; &lt;i&gt;shipmentEventTypeCode&#x3D;DRFT and equipmentEventTypeCode&#x3D;GTIN&lt;/i&gt; Since there is no event that can be a ShipmentEvent &lt;u&gt;and&lt;/u&gt; an EquipmentEvent at the same time &lt;b&gt;this will return an empty list&lt;/b&gt;! &lt;b&gt;Follow DCSA TNT 2.2.0 specifications&lt;/b&gt;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :event_type The type of event(s) to filter by. Possible values are - SHIPMENT (Shipment events) - TRANSPORT (Transport events) - EQUIPMENT (Equipment events) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example eventType&#x3D;SHIPMENT,EQUIPMENT matches both Shipment- and Equipment-events. Default value is all event types.
    # @option opts [Array<ShipmentEventTypeCode>] :shipment_event_type_code The status of the document in the process to filter by. Possible values are - RECE (Received) - DRFT (Drafted) - PENA (Pending Approval) - PENU (Pending Update) - REJE (Rejected) - APPR (Approved) - ISSU (Issued) - SURR (Surrendered) - SUBM (Submitted) - VOID (Void) - CONF (Confirmed) - REQS (Requested) - CMPL (Completed) - HOLD (On Hold) - RELS (Released) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;shipmentEventTypeCode&#x3D;RECE,DRFT&lt;/i&gt;  Matches &lt;b&gt;both&lt;/b&gt; Received (RECE) and Drafted (DRFT) shipment events. Default is all shipmentEventTypeCodes. This filter is only relevant when filtering on ShipmentEvents
    # @option opts [Array<DocumentTypeCode>] :document_type_code The documentTypeCode to filter by. Possible values are - CBR (Carrier Booking Request Reference) - BKG (Booking) - SHI (Shipping Instruction) - SRM (Shipment Release Message) - TRD (Transport Document) - ARN (Arrival Notice) - VGM (Verified Gross Mass) - CAS (Cargo Survey) - CUS (Customs Inspection) - DGD (Dangerous Goods Declaration) - OOG (Out of Gauge) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;documentTypeCode&#x3D;SHI,TRD&lt;/i&gt; Matches &lt;b&gt;both&lt;/b&gt; ShippingInstruction (SHI) and TransportDocument (TRD) shipment events. Default is all documentTypeCodes. This filter is only relevant when filtering on ShipmentEvents
    # @option opts [String] :carrier_booking_reference A set of unique characters provided by carrier to identify a booking. Specifying this filter will only return events related to this particular carrierBookingReference.
    # @option opts [String] :transport_document_reference A unique number reference allocated by the shipping line to the transport document and the main number used for the tracking of the status of the shipment. Specifying this filter will only return events related to this particular transportDocumentReference
    # @option opts [Array<TransportEventTypeCode>] :transport_event_type_code Identifier for type of Transport event to filter by - ARRI (Arrived) - DEPA (Departed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;transportEventTypeCode&#x3D;ARRI,DEPA&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Arrived (ARRI) and Departed (DEPA) transport events. Default is all transportEventTypeCodes. This filter is only relevant when filtering on TransportEvents
    # @option opts [String] :transport_call_id ID uniquely identifying a transport call, to filter events by. Specifying this filter will only return events related to this particular transportCallID
    # @option opts [String] :vessel_imo_number The identifier of vessel for which schedule details are published. Depending on schedule type, this may not be available yet. Specifying this filter will only return events related to this particular vesselIMONumber.
    # @option opts [String] :export_voyage_number Filter on the vessel operator-specific identifier of the export Voyage. Specifying this filter will only return events related to this particular exportVoyageNumber.
    # @option opts [String] :carrier_service_code Filter on the carrier specific identifier of the service. Specifying this filter will only return events related to this particular carrierServiceCode.
    # @option opts [String] :un_location_code The UN Location code specifying where the place is located. Specifying this filter will only return events related to this particular UN Location code.
    # @option opts [Array<EquipmentEventTypeCode>] :equipment_event_type_code Unique identifier for equipmentEventTypeCode. - LOAD (Loaded) - DISC (Discharged) - GTIN (Gated in) - GTOT (Gated out) - STUF (Stuffed) - STRP (Stripped) - PICK (Pick-up) - DROP (Drop-off) - INSP (Inspected) - RSEA (Resealed) - RMVD (Removed) It is possible to select multiple values by comma (,) separating them. For multiple values the OR-operator is used. For example &lt;i&gt;equipmentEventTypeCode&#x3D;GTIN,GTOT&lt;/i&gt; matches &lt;b&gt;both&lt;/b&gt; Gated in (GTIN) and Gated out (GTOT) equipment events. Default is all equipmentEventTypeCodes. This filter is only relevant when filtering on EquipmentEvents
    # @option opts [String] :equipment_reference Will filter by the unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. Specifying this filter will only return events related to this particular equipmentReference
    # @option opts [Time] :event_created_date_time Limit the result based on the creating date of the event. It is possible to use operators on this query parameter. This is done by adding a colon followed by an operator at the end of the queryParameterName (before the &#x3D;) &lt;i&gt;eventCreatedDateTime&lt;b&gt;&amp;#58;gte&lt;/b&gt;&#x3D;2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00&lt;/i&gt; would result in all events created &amp;#8805; 2021-04-01T14&amp;#58;12&amp;#58;56+01&amp;#58;00 The following operators are supported - &amp;#58;gte (&amp;#8805; Greater than or equal) - &amp;#58;gt (&amp;#62; Greater than) - &amp;#58;lte (&amp;#8804; Less than or equal) - &amp;#58;lt (&amp;#60; Less than) - &amp;#58;eq (&amp;#61; Equal to) If no operator is provided, a &lt;b&gt;strictly equal&lt;/b&gt; is used (this is equivalent to &lt;b&gt;&amp;#58;eq&lt;/b&gt; operator).
    # @option opts [Time] :event_date_time not DCSA - when search is done by container reference , allow to search the last container cycle happening before the provided date
    # @option opts [String] :behalf_of (Mandatory if you are a Third Party). This field specifies the end customer code you request a rate for. Use our referential API Partner to check if the end customer exists and to get its Partner ID code -- Not a standard DCSA attribute
    # @option opts [Integer] :limit Maximum number of items to return. (default to 100)
    # @option opts [String] :cursor A server generated value to specify a specific point in a collection result, used for pagination.
    # @return [Array<(Array<SearchMoveOnCommercialCycle200ResponseInner>, Integer, Hash)>] Array<SearchMoveOnCommercialCycle200ResponseInner> data, response status code and response headers
    def search_move_on_commercial_cycle_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.search_move_on_commercial_cycle ...'
      end
      allowable_values = ["SHIPMENT", "TRANSPORT", "EQUIPMENT"]
      if @api_client.config.client_side_validation && opts[:'event_type'] && !opts[:'event_type'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"event_type\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'carrier_booking_reference'].nil? && opts[:'carrier_booking_reference'].to_s.length > 35
        fail ArgumentError, 'invalid value for "opts[:"carrier_booking_reference"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 35.'
      end

      if @api_client.config.client_side_validation && !opts[:'transport_document_reference'].nil? && opts[:'transport_document_reference'].to_s.length > 20
        fail ArgumentError, 'invalid value for "opts[:"transport_document_reference"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 20.'
      end

      if @api_client.config.client_side_validation && !opts[:'transport_call_id'].nil? && opts[:'transport_call_id'].to_s.length > 100
        fail ArgumentError, 'invalid value for "opts[:"transport_call_id"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'vessel_imo_number'].nil? && opts[:'vessel_imo_number'].to_s.length > 7
        fail ArgumentError, 'invalid value for "opts[:"vessel_imo_number"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 7.'
      end

      if @api_client.config.client_side_validation && !opts[:'export_voyage_number'].nil? && opts[:'export_voyage_number'].to_s.length > 50
        fail ArgumentError, 'invalid value for "opts[:"export_voyage_number"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && !opts[:'carrier_service_code'].nil? && opts[:'carrier_service_code'].to_s.length > 5
        fail ArgumentError, 'invalid value for "opts[:"carrier_service_code"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 5.'
      end

      if @api_client.config.client_side_validation && !opts[:'un_location_code'].nil? && opts[:'un_location_code'].to_s.length > 5
        fail ArgumentError, 'invalid value for "opts[:"un_location_code"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 5.'
      end

      if @api_client.config.client_side_validation && !opts[:'equipment_reference'].nil? && opts[:'equipment_reference'].to_s.length > 15
        fail ArgumentError, 'invalid value for "opts[:"equipment_reference"]" when calling EventsApi.search_move_on_commercial_cycle, the character length must be smaller than or equal to 15.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling EventsApi.search_move_on_commercial_cycle, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/events'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'eventType'] = @api_client.build_collection_param(opts[:'event_type'], :csv) if !opts[:'event_type'].nil?
      query_params[:'shipmentEventTypeCode'] = @api_client.build_collection_param(opts[:'shipment_event_type_code'], :csv) if !opts[:'shipment_event_type_code'].nil?
      query_params[:'documentTypeCode'] = @api_client.build_collection_param(opts[:'document_type_code'], :csv) if !opts[:'document_type_code'].nil?
      query_params[:'carrierBookingReference'] = opts[:'carrier_booking_reference'] if !opts[:'carrier_booking_reference'].nil?
      query_params[:'transportDocumentReference'] = opts[:'transport_document_reference'] if !opts[:'transport_document_reference'].nil?
      query_params[:'transportEventTypeCode'] = @api_client.build_collection_param(opts[:'transport_event_type_code'], :csv) if !opts[:'transport_event_type_code'].nil?
      query_params[:'transportCallID'] = opts[:'transport_call_id'] if !opts[:'transport_call_id'].nil?
      query_params[:'vesselIMONumber'] = opts[:'vessel_imo_number'] if !opts[:'vessel_imo_number'].nil?
      query_params[:'exportVoyageNumber'] = opts[:'export_voyage_number'] if !opts[:'export_voyage_number'].nil?
      query_params[:'carrierServiceCode'] = opts[:'carrier_service_code'] if !opts[:'carrier_service_code'].nil?
      query_params[:'UNLocationCode'] = opts[:'un_location_code'] if !opts[:'un_location_code'].nil?
      query_params[:'equipmentEventTypeCode'] = @api_client.build_collection_param(opts[:'equipment_event_type_code'], :csv) if !opts[:'equipment_event_type_code'].nil?
      query_params[:'equipmentReference'] = opts[:'equipment_reference'] if !opts[:'equipment_reference'].nil?
      query_params[:'eventCreatedDateTime'] = opts[:'event_created_date_time'] if !opts[:'event_created_date_time'].nil?
      query_params[:'eventDateTime'] = opts[:'event_date_time'] if !opts[:'event_date_time'].nil?
      query_params[:'behalfOf'] = opts[:'behalf_of'] if !opts[:'behalf_of'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<SearchMoveOnCommercialCycle200ResponseInner>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth', 'oAuth2']

      new_options = opts.merge(
        :operation => :"EventsApi.search_move_on_commercial_cycle",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#search_move_on_commercial_cycle\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
