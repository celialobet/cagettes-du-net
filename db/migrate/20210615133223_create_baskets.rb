class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
