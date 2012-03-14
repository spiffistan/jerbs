class JobsController < ApplicationController

  def index
    @jobs = Job.order(:id).page params[:page]
  end

  def index_by_technology

    @jobs = Job.joins(:technologies).where(['technologies.id = ?', params[:technology_id]])
               .order(:id).page(params[:page])

    render 'index'

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
      respond_to do |format|
        format.html { render :action => "new" }
      end
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
