class Product < ApplicationRecord
  has_many :order_items
  has_many :pictures
  belongs_to :category
end
