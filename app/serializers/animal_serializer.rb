# frozen_string_literal: true

class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name_owner, :phone_owner, :name, :description, :street, :number, :city, :zipcode, :state, :neighborhood, :country, :longitude, :latitude, :created_at, :updated_at
  belongs_to :user
  belongs_to :category
end
