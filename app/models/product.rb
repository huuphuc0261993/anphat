class Product < ApplicationRecord
  has_many :order_items
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures
  belongs_to :category

  def pictures_attributes
    pictures.map { |i| { id: i.id, url: i.image.url, uid: i.id, name: i.image_identifier } }
  end

def pictures_ids
  pictures&.pluck(:id)
end

end
