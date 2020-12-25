class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :name, :encrypted_password
  
end