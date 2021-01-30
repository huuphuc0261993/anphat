class AddTypeToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :type_post, :integer
  end
end
