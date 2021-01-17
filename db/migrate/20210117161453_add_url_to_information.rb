class AddUrlToInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :information, :url, :text
  end
end
