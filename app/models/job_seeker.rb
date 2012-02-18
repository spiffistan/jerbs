class JobSeeker < ActiveRecord::Base
  has_one :user, :as => :rolable
  accepts_nested_attributes_for :user

  belongs_to :location
end
