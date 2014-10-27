class User < ActiveRecord::Base
	self.has_secure_password
  validates :fname, :lname, :email, presence: true
	has_many :houses
	has_many :clients, through: :houses
end