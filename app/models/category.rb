# frozen_string_literal: true

class Category < ApplicationRecord
  validates_presence_of :description

  has_many :animals


  def self.default_scope
    includes([:animals])
  end
end
