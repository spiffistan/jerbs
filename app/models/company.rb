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
#  sector      :integer
#

class Company < ActiveRecord::Base
  belongs_to :location
  # has_many :company_divisions
  has_many :jobs

  SECTORS = { :public => 1, :private => 2, :ideal => 3 }

  validates_inclusion_of :sector, :in => SECTORS.values
  validates_presence_of :name, :description, :address, :location_id
end
