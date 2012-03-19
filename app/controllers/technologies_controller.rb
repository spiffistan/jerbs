class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def show
    @technology = Technology.find(params[:id])

    @jobs_with_technology = Job.joins(:technologies).where('technologies.id = ?', params[:id]).group('jobs.id')
    @job_seekers_with_technology = JobSeeker.joins(:technologies).where('technologies.id = ?', params[:id]).group('job_seekers.id')

  end

  def list_results
    @technologies = Technology.find(:all)
  end

  def new
    @technology = Technology.new

    respond_to do |format|
      format.html
      format.json { render :json => @technology }
    end
  end

  def create
    @technology = Technology.new(params[:technology])
      if @technology.save

      else
        format.html { render :action => "new" }
    end
  end
end
