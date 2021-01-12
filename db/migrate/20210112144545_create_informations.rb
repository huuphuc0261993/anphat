class CreateInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :info

      t.timestamps
    end
  end
end
