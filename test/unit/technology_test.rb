# == Schema Information
#
# Table name: technologies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  shortname  :string(255)
#

require 'test_helper'

class TechnologyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
