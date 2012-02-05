class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_division
  has_and_belongs_to_many :technologies
end
