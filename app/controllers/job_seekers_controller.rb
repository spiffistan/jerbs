class JobSeekersController < ApplicationController
  def index
    @job_seekers = JobSeeker.order(:created_at).page(params[:page])
  end

  def show
   @job_seeker = JobSeeker.find(params[:id])

    respond_to do |format|
      format.html { render :html => @job_seeker }
    end
  end
end
