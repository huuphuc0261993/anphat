class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true

  def url
    image.url
  end
end
