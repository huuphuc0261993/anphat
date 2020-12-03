class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.text :title
      t.text :content
      t.datetime :deleted_at
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
