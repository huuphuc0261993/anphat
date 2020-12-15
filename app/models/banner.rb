class Banner < ApplicationRecord
  mount_uploader :name, ImageUploader
end
