# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  lat        :decimal(15, 10)
#  lng        :decimal(15, 10)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Location < ActiveRecord::Base
end
