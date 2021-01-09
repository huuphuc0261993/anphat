class ChangePriceSaleToBeStringInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price_sale, :string
  end
end
