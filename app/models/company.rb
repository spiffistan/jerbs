class Company < ActiveRecord::Base
  belongs_to :location
  has_many :divisions
end
