class RegistrationsController < Devise::RegistrationsController

  # Overriding due to multiple roles
  def create
    build_resource

    if job_seeker?
      resource.rolable = JobSeeker.new
    else
      resource.rolable = Employer.new
    end

    valid = resource.valid? && resource.rolable.valid?

    if valid && resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end

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
