# == Schema Information
#
# Table name: jobs
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text(255)
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
  has_and_belongs_to_many :technologies, :join_table => "jobs_technologies"

  attr_accessible :title, :description, :positions, :deadline, :deadline_asap
  attr_accessible :technology_ids
  accepts_nested_attributes_for :technologies

  searchable do
    text :title
    text :description
    integer :positions
  end

  validates_presence_of :title, :description, :positions
  validates_numericality_of :positions, :greater_than_or_equal_to => 1
end
