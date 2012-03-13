class JobSeekersController < ApplicationController
  def index
    @job_seekers = JobSeeker.all
  end

  def show
   @job_seeker = JobSeeker.find(params[:id])

    respond_to do |format|
      format.html { render :html => @job_seeker }
    end
  end
end
