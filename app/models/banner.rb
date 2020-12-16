class Banner < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  def pictures_attributes
    pictures.map { |i| { id: i.id, url: i.image.url, uid: i.id, name: i.image_identifier } }
  end

def pictures_ids
  pictures&.pluck(:id)
end
end
