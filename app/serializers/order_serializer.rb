class OrderSerializer < ActiveModel::Serializer
  attributes :id, :is_confirm, :total, :customer_id, :customer
  has_many :order_items
end