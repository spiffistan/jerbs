class JobSeeker < ActiveRecord::Base
  has_one :user, :as => :rolable

  belongs_to :location
end
