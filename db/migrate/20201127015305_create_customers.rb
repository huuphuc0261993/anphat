class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.text :name
      t.text :password
      t.integer :phone
      t.text :email
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
