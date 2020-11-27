class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.text :name
      t.integer :phone
      t.text :email
      t.date :deleted_at

      t.timestamps
    end
  end
end
