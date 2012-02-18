class Employer < ActiveRecord::Base
  has_one :user, :as => :rolable

  has_many :jobs
  belongs_to :location
end
