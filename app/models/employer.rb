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

class Employer < ActiveRecord::Base

  has_one :user, :as => :rolable
  has_one :location, :as => :locatable
  has_many :jobs

  has_attached_file :logo, :styles => { :medium => "300x300>", :small => "150x150>" }

  acts_as_mappable :through => :location

  attr_accessible :name, :position, :company_name, :company_description,
                  :company_address, :location, :logo

  validates_presence_of :name, :position, :company_name
  validates_uniqueness_of :company_name

  extend FriendlyId

  friendly_id :company_name, :use => :slugged
end
