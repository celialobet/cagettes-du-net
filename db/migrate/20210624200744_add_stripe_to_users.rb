class AddStripeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :plan, :string
    add_column :users, :stripe_customer_id, :string
    add_column :users, :session_token, :string
    add_index :users, :stripe_customer_id, unique: true
  end
end
