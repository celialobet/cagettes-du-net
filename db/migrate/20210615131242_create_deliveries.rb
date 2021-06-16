class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.datetime :time
      t.belongs_to :location, index: true
      t.belongs_to :user, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
