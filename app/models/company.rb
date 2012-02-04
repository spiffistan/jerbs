class Company < ActiveRecord::Base
  belongs_to :location
  has_many :divisions
  has_many :jobs
end
