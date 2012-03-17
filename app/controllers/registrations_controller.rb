class RegistrationsController < Devise::RegistrationsController

  include Geokit::Geocoders

  # GET /:resource/sign_up
  def new

    resource = build_resource({})

    if(params[:role] == :employer)
      resource.rolable = Employer.new
      resource.rolable.jobs << Job.new
    elsif(params[:role] == :job_seeker)
      resource.rolable = JobSeeker.new
    end

    # ip = request.remote_ip
    ip = '195.214.206.132'

    @latlng = MultiGeocoder.geocode(ip)
    res = GoogleGeocoder.reverse_geocode(@latlng)
    @geoloc = "#{res.city}" # , #{res.country}"

    respond_with resource
  end

  # POST /resource
  def create

    if(params[:role] == 'employer')
      resource = build_resource(params[:user])
      resource.rolable = Employer.new(params[:employer])
      resource.rolable.location = Location.new(params[:location])
      resource.rolable.jobs << Job.new(params[:job])

      unless resource.valid? && resource.rolable.valid? && resource.rolable.jobs[-1].valid?
        clean_up_passwords resource
        respond_with resource, :location => employer_sign_up_url
        return
      end
    elsif (params[:role] == 'job_seeker')
      resource = build_resource
      resource.rolable = JobSeeker.new(params[:job_seeker])
      resource.rolable.location = Location.new(params[:location])

      unless resource.valid? && resource.rolable.valid?
        clean_up_passwords resource
        respond_with resource, :location => job_seeker_sign_up_url
        return
      end
    else
      # TODO edge case
      return
    end

    if resource.save
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
      respond_with resource #, :location => after_inactive_sign_up_path_for(resource)
    end
  end

  protected

  # This is needed for sign up redirect
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) # TODO different paths for different folks
      root_path
    else
      super
    end
  end

end
