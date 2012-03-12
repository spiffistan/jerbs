# == Schema Information
#
# Table name: employers
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  position            :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  company_name        :string(255)
#  company_description :string(255)
#  company_address     :text
#  location_id         :integer
#

class Employer < ActiveRecord::Base
  has_one :user, :as => :rolable
  has_many :jobs

  belongs_to :location

  attr_accessible :name, :position, :company_name, :company_description, :company_address, :location_id

  validates_presence_of :name, :position, :company_name
  validates_uniqueness_of :company_name
end
