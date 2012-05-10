# == Schema Information
#
# Table name: locations
#
#  id           :integer         not null, primary key
#  lat          :decimal(15, 10)
#  lng          :decimal(15, 10)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  locatable_id :integer
#

class Location < ActiveRecord::Base

  acts_as_mappable
  # before_validation :geocode_address, :on => :create
  belongs_to :locatable, :polymorphic => true

end
