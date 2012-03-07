class Employer < ActiveRecord::Base
  has_one :user, :as => :rolable
  has_many :jobs

  belongs_to :location

  attr_accessible :name, :position, :company_name, :company_description, :company_addess, :location_id

  validates_presence_of :name, :position, :company_name, :company_description
end
