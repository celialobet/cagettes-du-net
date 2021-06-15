class CreateAdditionalProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.boolean :is_available

      t.timestamps
    end
  end
end
