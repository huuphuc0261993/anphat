class Picture < ApplicationRecord
  mount_uploader :title, ImageUploader
  belongs_to :product
end
