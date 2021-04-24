# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::GetLocationController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/getlocation").to route_to("api/v1/get_location#index")
    end
  end
end
