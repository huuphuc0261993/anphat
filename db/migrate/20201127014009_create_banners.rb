class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.text :name
      t.integer :banner_type
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
