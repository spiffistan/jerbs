class UserProfilesController < ApplicationController
  def index
    @user_profiles = User.all
  end
end
