class House < ActiveRecord::Base
  validates :sch_date, :sch_time, presence: true
	has_many :clients
end