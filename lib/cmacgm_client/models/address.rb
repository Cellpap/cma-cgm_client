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
  # An object for storing address related information
  class Address
    # Name of the address
    attr_accessor :name

    # The name of the street of the party’s address.
    attr_accessor :street

    # The number of the street of the party’s address.
    attr_accessor :street_number

    # The floor of the party’s street number.
    attr_accessor :floor

    # The post code of the party’s address.
    attr_accessor :post_code

    # The city name of the party’s address.
    attr_accessor :city

    # The state/region of the party’s address.
    attr_accessor :state_region

    # The country of the party’s address.
    attr_accessor :country

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'name' => :'name',
        :'street' => :'street',
        :'street_number' => :'streetNumber',
        :'floor' => :'floor',
        :'post_code' => :'postCode',
        :'city' => :'city',
        :'state_region' => :'stateRegion',
        :'country' => :'country'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'name' => :'String',
        :'street' => :'String',
        :'street_number' => :'String',
        :'floor' => :'String',
        :'post_code' => :'String',
        :'city' => :'String',
        :'state_region' => :'String',
        :'country' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `CMACGMClient::Address` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `CMACGMClient::Address`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'street')
        self.street = attributes[:'street']
      end

      if attributes.key?(:'street_number')
        self.street_number = attributes[:'street_number']
      end

      if attributes.key?(:'floor')
        self.floor = attributes[:'floor']
      end

      if attributes.key?(:'post_code')
        self.post_code = attributes[:'post_code']
      end

      if attributes.key?(:'city')
        self.city = attributes[:'city']
      end

      if attributes.key?(:'state_region')
        self.state_region = attributes[:'state_region']
      end

      if attributes.key?(:'country')
        self.country = attributes[:'country']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@name.nil? && @name.to_s.length > 100
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 100.')
      end

      if !@street.nil? && @street.to_s.length > 100
        invalid_properties.push('invalid value for "street", the character length must be smaller than or equal to 100.')
      end

      if !@street_number.nil? && @street_number.to_s.length > 50
        invalid_properties.push('invalid value for "street_number", the character length must be smaller than or equal to 50.')
      end

      if !@floor.nil? && @floor.to_s.length > 50
        invalid_properties.push('invalid value for "floor", the character length must be smaller than or equal to 50.')
      end

      if !@post_code.nil? && @post_code.to_s.length > 10
        invalid_properties.push('invalid value for "post_code", the character length must be smaller than or equal to 10.')
      end

      if !@city.nil? && @city.to_s.length > 65
        invalid_properties.push('invalid value for "city", the character length must be smaller than or equal to 65.')
      end

      if !@state_region.nil? && @state_region.to_s.length > 65
        invalid_properties.push('invalid value for "state_region", the character length must be smaller than or equal to 65.')
      end

      if !@country.nil? && @country.to_s.length > 75
        invalid_properties.push('invalid value for "country", the character length must be smaller than or equal to 75.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@name.nil? && @name.to_s.length > 100
      return false if !@street.nil? && @street.to_s.length > 100
      return false if !@street_number.nil? && @street_number.to_s.length > 50
      return false if !@floor.nil? && @floor.to_s.length > 50
      return false if !@post_code.nil? && @post_code.to_s.length > 10
      return false if !@city.nil? && @city.to_s.length > 65
      return false if !@state_region.nil? && @state_region.to_s.length > 65
      return false if !@country.nil? && @country.to_s.length > 75
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if name.nil?
        fail ArgumentError, 'name cannot be nil'
      end

      if name.to_s.length > 100
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 100.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] street Value to be assigned
    def street=(street)
      if street.nil?
        fail ArgumentError, 'street cannot be nil'
      end

      if street.to_s.length > 100
        fail ArgumentError, 'invalid value for "street", the character length must be smaller than or equal to 100.'
      end

      @street = street
    end

    # Custom attribute writer method with validation
    # @param [Object] street_number Value to be assigned
    def street_number=(street_number)
      if street_number.nil?
        fail ArgumentError, 'street_number cannot be nil'
      end

      if street_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "street_number", the character length must be smaller than or equal to 50.'
      end

      @street_number = street_number
    end

    # Custom attribute writer method with validation
    # @param [Object] floor Value to be assigned
    def floor=(floor)
      if floor.nil?
        fail ArgumentError, 'floor cannot be nil'
      end

      if floor.to_s.length > 50
        fail ArgumentError, 'invalid value for "floor", the character length must be smaller than or equal to 50.'
      end

      @floor = floor
    end

    # Custom attribute writer method with validation
    # @param [Object] post_code Value to be assigned
    def post_code=(post_code)
      if post_code.nil?
        fail ArgumentError, 'post_code cannot be nil'
      end

      if post_code.to_s.length > 10
        fail ArgumentError, 'invalid value for "post_code", the character length must be smaller than or equal to 10.'
      end

      @post_code = post_code
    end

    # Custom attribute writer method with validation
    # @param [Object] city Value to be assigned
    def city=(city)
      if city.nil?
        fail ArgumentError, 'city cannot be nil'
      end

      if city.to_s.length > 65
        fail ArgumentError, 'invalid value for "city", the character length must be smaller than or equal to 65.'
      end

      @city = city
    end

    # Custom attribute writer method with validation
    # @param [Object] state_region Value to be assigned
    def state_region=(state_region)
      if state_region.nil?
        fail ArgumentError, 'state_region cannot be nil'
      end

      if state_region.to_s.length > 65
        fail ArgumentError, 'invalid value for "state_region", the character length must be smaller than or equal to 65.'
      end

      @state_region = state_region
    end

    # Custom attribute writer method with validation
    # @param [Object] country Value to be assigned
    def country=(country)
      if country.nil?
        fail ArgumentError, 'country cannot be nil'
      end

      if country.to_s.length > 75
        fail ArgumentError, 'invalid value for "country", the character length must be smaller than or equal to 75.'
      end

      @country = country
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          street == o.street &&
          street_number == o.street_number &&
          floor == o.floor &&
          post_code == o.post_code &&
          city == o.city &&
          state_region == o.state_region &&
          country == o.country
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [name, street, street_number, floor, post_code, city, state_region, country].hash
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