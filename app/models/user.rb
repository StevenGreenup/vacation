class User < ActiveRecord::Base
  has_secure_password
  has_many :vacations
  has_many :photos, through: :vacations

end
