# == Schema Information
#
# Table name: jobs
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  deadline    :date
#  positions   :integer
#  company_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  freedom     :float
#

class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_division
  has_and_belongs_to_many :technologies
end
