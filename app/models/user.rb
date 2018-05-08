class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, format: /.+@.+/
  validates :name, presence: true
end