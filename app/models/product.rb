class Product < ApplicationRecord
  has_many :order_items
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  belongs_to :category
end
