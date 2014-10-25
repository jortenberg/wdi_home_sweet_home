class Client < ActiveRecord::Base
  validates :fname, :lname, :email, presence: true
	belongs_to :house
end