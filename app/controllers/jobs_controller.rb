class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
   @job = Job.find(params[:id])

    respond_to do |format|
      format.html { render :html => @job }
    end
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

  def search
    search = Job.search do
      keywords params[:query]
    end

    @jobs = search.results

    logger.info @jobs.inspect

    respond_to do |format|
      format.json { render :json => @jobs }
    end
  end

end
