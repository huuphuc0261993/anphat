class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :title
      t.date :deleted_at
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
