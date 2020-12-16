class BannerSerializer < ActiveModel::Serializer
  attributes :id, :name, :banner_type, :pictures_ids
  has_many :pictures
end

