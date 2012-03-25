class JobsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index, :search, :apply, :index_by_technology]
  helper_method :sort_column, :sort_direction

  def index

      @jobs = Job.joins(:employer).order("#{sort_column} #{sort_direction}").page(params[:page])

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

  private

  # TODO order by company_name, company_address, etc.

  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

end
