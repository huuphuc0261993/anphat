class AddSubtitleToBanners < ActiveRecord::Migration[6.0]
  def change
    add_column :banners, :subtitle, :string
  end
end
