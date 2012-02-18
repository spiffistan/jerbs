class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def list_results
    @jobs = Job.find(:all)
  end

  def new
    @job = Job.new

    respond_to do |format|
      format.html
      format.json { render :json => @job }
    end
  end

  def create
    @job = Job.new(params[:job])
      if @job.save

      else
        format.html { render :action => "new" }
    end
  end
end
