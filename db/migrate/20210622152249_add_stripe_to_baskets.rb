class AddStripeToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :stripe_price, :string
  end
end
