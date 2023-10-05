class User < ApplicationRecord
  has_secure_password
  has_many :user_roles
  has_many :roles, through: :user_roles
  validates_presence_of :email

  def generate_token
    token = SecureRandom.hex(10)
    self.update(token: token)
    token
  end
end
