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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
