# == Schema Information
#
# Table name: companies
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  address     :text
#  location_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  sector      :integer
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
