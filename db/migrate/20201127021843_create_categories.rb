class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.date :deleted_at

      t.timestamps
    end
  end
end
