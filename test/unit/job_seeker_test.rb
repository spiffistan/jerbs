# == Schema Information
#
# Table name: job_seekers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class JobSeekerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
