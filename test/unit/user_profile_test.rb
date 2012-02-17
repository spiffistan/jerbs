# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
