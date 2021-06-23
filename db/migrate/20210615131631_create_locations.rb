class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :address_number
      t.string :address_street
      t.string :address_city, :default => "Paris"
      t.integer :zip_code
      t.text :description
      t.string :day
      t.integer :time
      t.string :opening_hours
      t.boolean :validated, :default => false

      t.timestamps
    end
  end
end
