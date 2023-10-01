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
  class DocumentTypeCode
    CBR = "CBR".freeze
    BKG = "BKG".freeze
    SHI = "SHI".freeze
    SRM = "SRM".freeze
    TRD = "TRD".freeze
    ARN = "ARN".freeze
    VGM = "VGM".freeze
    CAS = "CAS".freeze
    CUS = "CUS".freeze
    DGD = "DGD".freeze
    OOG = "OOG".freeze

    def self.all_vars
      @all_vars ||= [CBR, BKG, SHI, SRM, TRD, ARN, VGM, CAS, CUS, DGD, OOG].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if DocumentTypeCode.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #DocumentTypeCode"
    end
  end
end
