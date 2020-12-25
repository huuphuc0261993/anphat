class BannerSerializer < ActiveModel::Serializer
  attributes :id, :name, :banner_type, :pictures_ids, :pictures_attributes
  has_many :pictures
end

