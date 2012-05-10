# == Schema Information
#
# Table name: employers
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  position            :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  company_name        :string(255)
#  company_description :string(255)
#  company_address     :text
#  location_id         :integer
#  logo_file_name      :string(255)
#  logo_content_type   :string(255)
#  logo_file_size      :integer
#  logo_updated_at     :datetime
#  slug                :string(255)
#  url                 :string(255)
#

require 'test_helper'

class EmployerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
