class BannerSerializer < ActiveModel::Serializer
  attributes :id, :name, :banner_type, :pictures_ids, :pictures_attributes, :created_at, :description, :fullname, :work, :position
  has_many :pictures
end