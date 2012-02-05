# == Schema Information
#
# Table name: companies
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  address     :text
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Company < ActiveRecord::Base
  belongs_to :location
  has_many :company_divisions
  has_many :jobs
end
