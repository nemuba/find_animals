# frozen_string_literal: true

class ChangeTableCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user_id
  end
end
