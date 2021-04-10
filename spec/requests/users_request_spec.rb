# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  before { create_list(:user, 10) }

  let(:user) { User.first }

  let(:valid_attributes) {
    attributes_for(:user)
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  let(:valid_headers) {
    {
      Authorization: "Bearer #{jwt_and_refresh_token(user, 'user').first}"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      User.create! valid_attributes
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /index" do
    it "render 10 categories" do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(json_body.size).to eql(10)
    end
  end

  describe "GET /index" do
    it "json expectations" do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(json_body).to include_json([
          id: be_an(Integer),
          name: be_a(String),
          email: be_a(String),
          created_at: be_a(String),
          updated_at: be_a(String),
      ])
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get api_v1_user_url(user), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "json expectations" do
      user = User.create! valid_attributes
      get api_v1_user_url(user), headers: valid_headers, as: :json
      expect(json_body).to include_json(
        id: user.id
      )
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post api_v1_users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post api_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect {
          post api_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post api_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:user)
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        expect(user.name).to eql(new_attributes[:name])
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes
        patch api_v1_user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete api_v1_user_url(user), headers: valid_headers, as: :json
      }.to change(User, :count).by(-1)
    end
  end
end
