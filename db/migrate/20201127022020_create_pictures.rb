class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :image
      t.datetime :deleted_at
      t.references :product, null: true, foreign_key: false

      t.timestamps
    end
  end
end
