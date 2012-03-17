class HomeController < ApplicationController
  def index
    @num_jobs = Job.count
    @num_users = User.count

    @selected_jobs = Job.order('RANDOM()').limit(4) # TODO
    @new_jobs = Job.order('RANDOM()').offset(4).limit(4) # TODO
    @popular_jobs = Job.order('RANDOM()').offset(8).limit(4) # TODO
  end

  def map
    @locations = Location.all
  end
end
