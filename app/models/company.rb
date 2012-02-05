class Company < ActiveRecord::Base
  belongs_to :location
  has_many :company_divisions
  has_many :jobs
end
