class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def list_results
    @jobs = Job.find(:all)
  end
end
