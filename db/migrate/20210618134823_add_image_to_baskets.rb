class AddImageToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :image_url, :string
  end
end
