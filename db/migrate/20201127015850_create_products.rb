class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :price
      t.text :description
      t.integer :discount
      t.integer :price_sale
      t.date :deleted_at
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
