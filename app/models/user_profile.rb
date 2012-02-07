# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  name        :string(255)
#  url         :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class UserProfile < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
end
