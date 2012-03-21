class JobsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index, :search, :apply, :index_by_technology]

  def index
    @jobs = Job.order('created_at DESC').page(params[:page])
  end

  # XXX should this be here?
  def index_by_technology

    @jobs = Job.joins(:technologies)
               .where(['technologies.id = ?', params[:technology_id]])
               .order('created_at DESC')
               .group('jobs.id')
               .page(params[:page])

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
    @job.employer = User.find(current_user.id).rolable

    if @job.save
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render :action => "new" }
      end
    end
  end

  def search

    unless params[:query].nil?
      search = Job.search do
        keywords params[:query]
        spellcheck :only_more_popular => true, :count => 1
      end
      @jobs = search.results
      unless search.collation.nil?
        @suggestion = search.collation
      end
    else
      @jobs = []
    end

    respond_to do |format|
      # format.json { render :json => @jobs }
      format.html { render :html => @jobs }
    end
  end

  def apply
    @job = Job.find(params[:id])

  end

end
