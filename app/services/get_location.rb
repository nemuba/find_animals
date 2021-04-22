# frozen_string_literal: true

class GetLocation
  attr_accessor :longitude, :latitude, :address

  def initialize(longitude, latitude)
    @longitude = longitude
    @latitude = latitude
  end

  def perform
    data = Geocoder.search([longitude, latitude])

    return location_not_found unless data.present?

    @address = data.first

    return location_not_found unless address.present? && address.data["address"].present?

    location
  end

  def location
    {
      location: {
        street: address.data["address"]["road"],
        neighborhood: address.data["address"]["suburb"],
        city: address.data["address"]["town"],
        state: address.data["address"]["state"],
        country: address.data["address"]["country"],
        zipcode: address.data["address"]["postcode"]
      }
    }
  end

  private
    def location_not_found
      { status: "error", msg: "Location not found " }
    end
end
