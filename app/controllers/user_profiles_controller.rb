class UserProfilesController < ApplicationController
  def index
    @user_profiles = UserProfile.all
  end

  def new
    @user_profile = UserProfile.new

  end
end
