class EmployersController < ApplicationController

  def show
    if not params[:slug].nil?
      @employer = Employer.first(:conditions => { :slug => request.subdomain })
    else
      @employer = Employer.find(params[:id])
    end

    @techs = []
    @employer.jobs.each do |job|
      job.technologies.each do |tech|
        @techs << tech
      end
    end

    @techs.uniq!

    respond_to do |format|
      format.html { render :html => @employer }
    end
  end

  def show_by_name
    @employer = Employer.where('company_name = ?', params[:company_name]).first

    unless @employer.nil?

      respond_to do |format|
        format.html { render :html => @employer }
      end
    end
  end

  def index
    @employers = Employer.all
  end


end
