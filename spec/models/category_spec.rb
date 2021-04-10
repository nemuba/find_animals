# frozen_string_literal: true

require "rails_helper"

RSpec.describe Category, type: :model do
  subject { create(:category) }

  it "Description present" do
    should validate_presence_of(:description)
  end
end
