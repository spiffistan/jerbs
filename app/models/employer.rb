class Employer < ActiveRecord::Base
  has_one :user, :as => :rolable
  accepts_nested_attributes_for :user

  has_many :jobs
  belongs_to :company
  belongs_to :location
end
