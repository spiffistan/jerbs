module RegistrationsHelper

  # These are needed due to customizing devise

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def job_seeker?
    params[:role] == :job_seeker
  end

end
