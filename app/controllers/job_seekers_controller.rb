class JobSeekersController < ApplicationController
  def index
    @job_seekers = JobSeeker.all
  end
end
