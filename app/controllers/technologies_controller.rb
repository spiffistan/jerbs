class JobsController < ApplicationController
  def index
    @technologies = Technology.all
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
