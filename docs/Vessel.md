# CMACGMClient::Vessel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vessel_imo_number** | **String** | The unique reference for a registered Vessel. The reference is the International Maritime Organisation (IMO) number, also sometimes known as the Lloyd&amp;apos;s register code, which does not change during the lifetime of the vessel |  |
| **vessel_name** | **String** | The name of the Vessel given by the Vessel Operator and registered with IMO. | [optional] |
| **vessel_flag** | **String** | The flag of the nation whose laws the vessel is registered under. This is the ISO 3166 two-letter country code | [optional] |
| **vessel_call_sign_number** | **String** | A unique alphanumeric identity that belongs to the vessel and is assigned by the International Telecommunication Union (ITU). It consists of a threeletter alphanumeric prefix that indicates nationality, followed by one to four characters to identify the individual vessel. For instance, vessels registered under Denmark are assigned the prefix ranges 5PA-5QZ, OUAOZZ, and XPA-XPZ. The Call Sign changes whenever a vessel changes its flag. | [optional] |
| **vessel_operator_carrier_code** | **String** | The carrier who is in charge of the vessel operation based on either the SMDG or SCAC code lists | [optional] |
| **vessel_operator_carrier_code_list_provider** | [**VesselOperatorCarrierCodeListProvider**](VesselOperatorCarrierCodeListProvider.md) |  | [optional] |

## Example

```ruby
require 'cmacgm_client'

instance = CMACGMClient::Vessel.new(
  vessel_imo_number: 9321483,
  vessel_name: King of the Seas,
  vessel_flag: DE,
  vessel_call_sign_number: NCVV,
  vessel_operator_carrier_code: MAEU,
  vessel_operator_carrier_code_list_provider: null
)
```

