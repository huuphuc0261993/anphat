class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :quantity, :order, :product
  belongs_to :order
end