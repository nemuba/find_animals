# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api Guard", type: :request do
  let(:params_sign_up) {
    {
      email: Faker::Internet.email,
      password: "123456789",
      password_confirmation: "123456789",
    }
  }

  describe "POST api/v1/authenticate/sign_up" do
    it "Create User" do
      post api_v1_authenticate_sign_up_url, params: params_sign_up, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST api/v1/authenticate/sign_in" do
    it "User Sign in" do
      new_user = attributes_for(:user)
      User.create!(new_user)
      post api_v1_authenticate_sign_in_url, params: { email: new_user[:email], password: new_user[:password] }
      expect(response).to be_successful
    end
  end
end
