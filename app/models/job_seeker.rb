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
  # has_and_belongs_to_many :technologies
  accepts_nested_attributes_for :user

  attr_accessible :name, :url

  validates_presence_of :name

  belongs_to :location
end
