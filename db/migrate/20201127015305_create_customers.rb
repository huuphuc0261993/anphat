class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.text :name
      t.integer :phone
      t.text :email, null:false
      t.text :encrypted_password, null:false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
