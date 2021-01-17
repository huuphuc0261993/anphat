class AddFullnameToBanners < ActiveRecord::Migration[6.0]
  def change
    add_column :banners, :fullname, :string
    add_column :banners, :position, :string
    add_column :banners, :work, :string
    add_column :banners, :description, :text
  end
end
