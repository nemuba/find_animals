# frozen_string_literal: true

require "rails_helper"

RSpec.describe "api/v1/getlocation", type: :request do
  let(:path_url) { "#{api_v1_getlocation_url}?longitude=-23.4282534&latitude=-45.1204642" }

  it "renders a successful response" do
    get path_url, as: :json
    expect(response).to be_successful
  end

  it "renders a location address" do
    get path_url, as: :json
    expect(json_body).to include_json(
      location: {
        street: be_an(String),
        neighborhood: be_an(String),
        city: be_an(String),
        state: be_an(String),
        country: be_an(String),
        zipcode: be_an(String)
      }
    )
  end
end
