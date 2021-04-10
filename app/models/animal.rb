# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name,
            :description,
            :name_owner,
            :phone_owner,
            :street,
            :number,
            :state,
            :city,
            :country,
            :neighborhood,
            :zipcode,
            :latitude,
            :longitude,
            presence: true
end
