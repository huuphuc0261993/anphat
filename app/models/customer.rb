class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
