class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :imageable, polymorphic: true, optional: true

  def url
    image.url
  end
end
