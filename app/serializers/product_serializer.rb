class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :discount, :price_sale, :category_id, :category, :pictures_attributes, :pictures_ids, :youtube
  has_many :pictures
end
