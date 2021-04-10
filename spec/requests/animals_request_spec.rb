# frozen_string_literal: true

require "rails_helper"

RSpec.describe "api/v1/animals", type: :request do
  before { create_list(:animal, 10) }

  let(:user) { create(:user) }

  let(:valid_attributes) {
    build(:animal).attributes.except(:id, :created_at, :updated_at)
  }

  let(:invalid_attributes) {
    { description: nil, name: nil, name_owner: nil }
  }

  let(:valid_headers) {
    {
      Authorization: "Bearer #{jwt_and_refresh_token(user, 'user').first}"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Animal.create! valid_attributes
      get api_v1_animals_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /index" do
    it "render 10 animals" do
      get api_v1_animals_url, headers: valid_headers, as: :json
      expect(json_body.size).to eql(10)
    end
  end

  describe "GET /index" do
    it "json expectations" do
      get api_v1_animals_url, headers: valid_headers, as: :json
      expect(json_body).to include_json([
          id: be_an(Integer),
          name: be_a(String),
          description: be_a(String),
      ])
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      animal = Animal.create! valid_attributes
      get api_v1_animal_url(animal), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "json expectations" do
      animal = Animal.create! valid_attributes
      get api_v1_animal_url(animal), headers: valid_headers, as: :json
      expect(json_body).to include_json(
        id: animal.id
      )
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Animal" do
        expect {
          post api_v1_animals_url,
            params: { animal: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Animal, :count).by(1)
      end

      it "renders a JSON response with the new animal" do
        post api_v1_animals_url,
             params: { animal: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Animal" do
        expect {
          post api_v1_animals_url,
               params: { animal: invalid_attributes }, as: :json
        }.to change(Animal, :count).by(0)
      end

      it "renders a JSON response with errors for the new animal" do
        post api_v1_animals_url,
             params: { animal: invalid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:animal)
      }

      it "updates the requested animal" do
        animal = Animal.create! valid_attributes
        patch api_v1_animal_url(animal),
              params: { animal: new_attributes }, headers: valid_headers, as: :json

        expect(json_body).to include_json(name: new_attributes[:name])
      end

      it "renders a JSON response with the animal" do
        animal = Animal.create! valid_attributes
        patch api_v1_animal_url(animal),
              params: { animal: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the animal" do
        animal = Animal.create! valid_attributes
        patch api_v1_animal_url(animal),
              params: { animal: invalid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested animal" do
      animal = Animal.create! valid_attributes
      expect {
        delete api_v1_animal_url(animal), headers: valid_headers, as: :json
      }.to change(Animal, :count).by(-1)
    end
  end
end
