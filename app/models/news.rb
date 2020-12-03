class News < ApplicationRecord
    # act_as_paranoid
    mount_uploader :image, ImageUploader
end
