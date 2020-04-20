class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :total_payment
      t.integer :postage
      t.integer :status
      t.integer :payment_method
      t.string :address_name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
