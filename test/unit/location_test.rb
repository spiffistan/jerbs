# == Schema Information
#
# Table name: locations
#
#  id           :integer         not null, primary key
#  lat          :decimal(15, 10)
#  lng          :decimal(15, 10)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  locatable_id :integer
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
