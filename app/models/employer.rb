class Employer < ActiveRecord::Base
  has_one :user, :as => :rolable
  has_many :jobs

  belongs_to :location

  attr_accessible :name, :position, :company_name, :company_description, :company_address, :location_id

  validates_presence_of :name, :position, :company_name
  validates_uniqueness_of :company_name
end
