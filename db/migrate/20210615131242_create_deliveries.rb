class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.datetime :time

      t.timestamps
    end
  end
end