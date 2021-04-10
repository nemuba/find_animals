# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at

  has_many :animals, serializer: AnimalSerializer
end
