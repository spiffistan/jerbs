# == Schema Information
#
# Table name: jobs
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  deadline    :date
#  positions   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  freedom     :float
#  percentage  :integer
#  employer_id :integer
#

class Job < ActiveRecord::Base
  belongs_to :employer
  has_and_belongs_to_many :technologies

  acts_as_indexed :fields => [:title, :description]
end
