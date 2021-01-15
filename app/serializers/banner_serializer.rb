class BannerSerializer < ActiveModel::Serializer
  attributes :id, :name, :banner_type, :pictures_ids, :pictures_attributes, :created_at
  has_many :pictures
end