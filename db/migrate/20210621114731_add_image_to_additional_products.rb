class AddImageToAdditionalProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :additional_products, :image_url, :string
  end
end
