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

class Technology < ActiveRecord::Base
  has_and_belongs_to_many :jobs
end
