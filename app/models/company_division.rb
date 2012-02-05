# == Schema Information
#
# Table name: company_divisions
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class CompanyDivision < ActiveRecord::Base
  belongs_to :company
  has_many :jobs
end
