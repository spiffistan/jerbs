class HomeController < ApplicationController
  def index
    @num_jobs = Job.count 
    @num_users = User.count
  end
end
