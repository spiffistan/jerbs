module RegistrationsHelper

  # These are needed due to customizing devise

  def resource
    :user
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def job_seeker?
    params[:role] == :job_seeker
  end

end
