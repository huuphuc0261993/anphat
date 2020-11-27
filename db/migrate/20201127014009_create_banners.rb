class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.text :name
      t.integer :banner_type
      t.date :deleted_at

      t.timestamps
    end
  end
end
