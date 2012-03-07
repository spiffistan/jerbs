# == Schema Information
#
# Table name: job_seekers
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  name        :string(255)
#  url         :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class JobSeeker < ActiveRecord::Base
  has_one :user, :as => :rolable
  accepts_nested_attributes_for :user

  belongs_to :location
end
