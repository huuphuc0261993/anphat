class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :is_confirm
      t.date :deleted_at
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
