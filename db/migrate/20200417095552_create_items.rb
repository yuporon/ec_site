class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.string :image_id
      t.integer :price_nontax
      t.integer :sale_status

      t.timestamps
    end
  end
end
