# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  subject { create(:animal) }

  it "Name present" do
    expect validate_presence_of(:name)
  end

  it "Description present" do
    expect validate_presence_of(:description)
  end

  it "Name Owner present" do
    expect validate_presence_of(:name_owner)
  end

  it "Phone Owner present" do
    expect validate_presence_of(:phone_owner)
  end

  it "Street present" do
    expect validate_presence_of(:street)
  end

  it "Neighborhood present" do
    expect validate_presence_of(:neighborhood)
  end

  it "Number present" do
    expect validate_presence_of(:number)
  end

  it "City present" do
    expect validate_presence_of(:city)
  end

  it "State present" do
    expect validate_presence_of(:state)
  end

  it "Zip Code present" do
    expect validate_presence_of(:zipcode)
  end

  it "Belong to user present" do
    expect belong_to(:user)
  end

  it "Belong to category present" do
    expect belong_to(:category)
  end

  it "Latitude present" do
    expect validate_presence_of(:latitude)
  end

  it "Longitude present" do
    expect validate_presence_of(:longitude)
  end
end
