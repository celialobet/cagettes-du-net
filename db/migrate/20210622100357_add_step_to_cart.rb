class AddStepToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :step, :integer, :default => 0
  end
end
