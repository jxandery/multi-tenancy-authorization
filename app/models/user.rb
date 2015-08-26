class User < ActiveRecord::Base
  has_secure_password

  belongs_to :store
  has_many :orders

  has_many :user_roles
  has_many :roles, through: :user_roles
end
