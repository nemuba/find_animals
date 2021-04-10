class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name_owner
      t.string :phone_owner
      t.string :name
      t.string :description
      t.string :street
      t.string :number
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :neighborhood
      t.string :country
      t.string :longitude
      t.string :latitude
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
