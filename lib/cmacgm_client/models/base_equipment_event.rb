=begin
#Logistic Tracking service API - DCSA OpenAPI specification for Track & Trace v2.2.0

#Managing and sending Shipment-, Transport- and Equipment-events and subscriptions for Track &amp; Trace (T&amp;T). API specification issued by DCSA.org.  <i>Please note that shipment events and subscription management are not covered yet by CMA CGM API.</i>  <br> This API is accessible through <ul> <li> <b> Public </b> connection (authentication with API Key): this allows to retrieve standard equipment moves (e.g. ready to be loaded, discharged), Transhipment moves (e.g. discharged and re-loaded onboard) and planned vessel departure and arrival dates. </li> <li> <b> Private </b> connection (authentication with Oauth2 client credentials): this allows to retrieve additional private events such as actual rail and ramp moves, planned departure and arrival dates for inland moves. These private events are available only if you (or your end customer) are identified on the booking as: Booking Party, Deciding Party, Consignee, Notifier or Shipper. </li> </ul> </br> For explanation to specific values or objects please refer to the <a href='https://dcsa.org/wp-content/uploads/2021/10/202108_DCSA_P1_Information-Model-v3.3_TNT22_Final.pdf'>Information Model v3.3</a> Polling can be done on the <b>GET /events</b> endPoint. DCSA version 2.2.0

The version of the OpenAPI document: 2.2.4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'date'
require 'time'

module CMACGMClient
  # The equipment event entity is a specialization of the event entity to support specification of data that only applies to an equipment event.
  class BaseEquipmentEvent
    attr_accessor :references

    attr_accessor :seals

    attr_accessor :event_type

    # Code for the event classifier can be - PLN (Planned) - ACT (Actual) - EST (Estimated)
    attr_accessor :event_classifier_code

    attr_accessor :equipment_event_type_code

    # The unique identifier for the equipment, which should follow the BIC ISO Container Identification Number where possible. According to ISO 6346, a container identification code consists of a 4-letter prefix and a 7-digit number (composed of a 3-letter owner code, a category identifier, a serial number, and a check-digit). If a container does not comply with ISO 6346, it is suggested to follow Recommendation
    attr_accessor :equipment_reference

    # Unique code for the different equipment size/type used for transporting commodities. The code is a concatenation of ISO Equipment Size Code and ISO Equipment Type Code A and follows the ISO 6346 standard.
    attr_accessor :iso_equipment_code

    attr_accessor :empty_indicator_code

    attr_accessor :event_location

    attr_accessor :transport_call

    # An optional list of key-value (documentReferenceType-documentReferenceValue) pairs representing links to objects relevant to the event. The <b>documentReferenceType</b>-field is used to describe where the <b>documentReferenceValue</b>-field is pointing to.
    attr_accessor :document_references

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'references' => :'references',
        :'seals' => :'seals',
        :'event_type' => :'eventType',
        :'event_classifier_code' => :'eventClassifierCode',
        :'equipment_event_type_code' => :'equipmentEventTypeCode',
        :'equipment_reference' => :'equipmentReference',
        :'iso_equipment_code' => :'ISOEquipmentCode',
        :'empty_indicator_code' => :'emptyIndicatorCode',
        :'event_location' => :'eventLocation',
        :'transport_call' => :'transportCall',
        :'document_references' => :'documentReferences'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'references' => :'Array<Reference>',
        :'seals' => :'Array<Seal>',
        :'event_type' => :'String',
        :'event_classifier_code' => :'String',
        :'equipment_event_type_code' => :'EquipmentEventTypeCode',
        :'equipment_reference' => :'String',
        :'iso_equipment_code' => :'String',
        :'empty_indicator_code' => :'EmptyIndicatorCode',
        :'event_location' => :'Location',
        :'transport_call' => :'TransportCall',
        :'document_references' => :'Array<DocumentReferencesInner>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'References',
      :'Seals'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `CMACGMClient::BaseEquipmentEvent` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `CMACGMClient::BaseEquipmentEvent`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'references')
        if (value = attributes[:'references']).is_a?(Array)
          self.references = value
        end
      end

      if attributes.key?(:'seals')
        if (value = attributes[:'seals']).is_a?(Array)
          self.seals = value
        end
      end

      if attributes.key?(:'event_type')
        self.event_type = attributes[:'event_type']
      end

      if attributes.key?(:'event_classifier_code')
        self.event_classifier_code = attributes[:'event_classifier_code']
      end

      if attributes.key?(:'equipment_event_type_code')
        self.equipment_event_type_code = attributes[:'equipment_event_type_code']
      else
        self.equipment_event_type_code = nil
      end

      if attributes.key?(:'equipment_reference')
        self.equipment_reference = attributes[:'equipment_reference']
      end

      if attributes.key?(:'iso_equipment_code')
        self.iso_equipment_code = attributes[:'iso_equipment_code']
      end

      if attributes.key?(:'empty_indicator_code')
        self.empty_indicator_code = attributes[:'empty_indicator_code']
      else
        self.empty_indicator_code = nil
      end

      if attributes.key?(:'event_location')
        self.event_location = attributes[:'event_location']
      end

      if attributes.key?(:'transport_call')
        self.transport_call = attributes[:'transport_call']
      end

      if attributes.key?(:'document_references')
        if (value = attributes[:'document_references']).is_a?(Array)
          self.document_references = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @equipment_event_type_code.nil?
        invalid_properties.push('invalid value for "equipment_event_type_code", equipment_event_type_code cannot be nil.')
      end

      if !@equipment_reference.nil? && @equipment_reference.to_s.length > 15
        invalid_properties.push('invalid value for "equipment_reference", the character length must be smaller than or equal to 15.')
      end

      if !@iso_equipment_code.nil? && @iso_equipment_code.to_s.length > 4
        invalid_properties.push('invalid value for "iso_equipment_code", the character length must be smaller than or equal to 4.')
      end

      if @empty_indicator_code.nil?
        invalid_properties.push('invalid value for "empty_indicator_code", empty_indicator_code cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      event_type_validator = EnumAttributeValidator.new('String', ["EQUIPMENT"])
      return false unless event_type_validator.valid?(@event_type)
      event_classifier_code_validator = EnumAttributeValidator.new('String', ["PLN", "ACT", "EST"])
      return false unless event_classifier_code_validator.valid?(@event_classifier_code)
      return false if @equipment_event_type_code.nil?
      return false if !@equipment_reference.nil? && @equipment_reference.to_s.length > 15
      return false if !@iso_equipment_code.nil? && @iso_equipment_code.to_s.length > 4
      return false if @empty_indicator_code.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] event_type Object to be assigned
    def event_type=(event_type)
      validator = EnumAttributeValidator.new('String', ["EQUIPMENT"])
      unless validator.valid?(event_type)
        fail ArgumentError, "invalid value for \"event_type\", must be one of #{validator.allowable_values}."
      end
      @event_type = event_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] event_classifier_code Object to be assigned
    def event_classifier_code=(event_classifier_code)
      validator = EnumAttributeValidator.new('String', ["PLN", "ACT", "EST"])
      unless validator.valid?(event_classifier_code)
        fail ArgumentError, "invalid value for \"event_classifier_code\", must be one of #{validator.allowable_values}."
      end
      @event_classifier_code = event_classifier_code
    end

    # Custom attribute writer method with validation
    # @param [Object] equipment_reference Value to be assigned
    def equipment_reference=(equipment_reference)
      if equipment_reference.nil?
        fail ArgumentError, 'equipment_reference cannot be nil'
      end

      if equipment_reference.to_s.length > 15
        fail ArgumentError, 'invalid value for "equipment_reference", the character length must be smaller than or equal to 15.'
      end

      @equipment_reference = equipment_reference
    end

    # Custom attribute writer method with validation
    # @param [Object] iso_equipment_code Value to be assigned
    def iso_equipment_code=(iso_equipment_code)
      if iso_equipment_code.nil?
        fail ArgumentError, 'iso_equipment_code cannot be nil'
      end

      if iso_equipment_code.to_s.length > 4
        fail ArgumentError, 'invalid value for "iso_equipment_code", the character length must be smaller than or equal to 4.'
      end

      @iso_equipment_code = iso_equipment_code
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          references == o.references &&
          seals == o.seals &&
          event_type == o.event_type &&
          event_classifier_code == o.event_classifier_code &&
          equipment_event_type_code == o.equipment_event_type_code &&
          equipment_reference == o.equipment_reference &&
          iso_equipment_code == o.iso_equipment_code &&
          empty_indicator_code == o.empty_indicator_code &&
          event_location == o.event_location &&
          transport_call == o.transport_call &&
          document_references == o.document_references
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [references, seals, event_type, event_classifier_code, equipment_event_type_code, equipment_reference, iso_equipment_code, empty_indicator_code, event_location, transport_call, document_references].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = CMACGMClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
