class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :items_id
      t.integer :order_quanitity
      t.integer :is_production
      t.integer :current_value

      t.timestamps
    end
  end
end
