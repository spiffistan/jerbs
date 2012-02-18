class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected

  # This is needed for sign up redirect
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) # TODO different paths for different folks
      new_user_profile_path
    else
      super
    end
  end

end
