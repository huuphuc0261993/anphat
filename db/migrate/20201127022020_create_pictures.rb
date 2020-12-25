class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :image
      t.datetime :deleted_at  
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
