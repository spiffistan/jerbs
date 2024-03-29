require 'forgery'
require 'cgi'
include Geokit::Geocoders

namespace :db do
  desc 'Fill database with fake data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    50.times do
      name = Forgery(:jerbs).technology
      shortname = name
 
#      if name.length < 5
#        shortname = name
#      elsif name =~ / /
#        shortname = name.split(" ").map {|name| name[0].chr }.join
#      else
#        shortname = name.slice(0..4)
#      end
      technology = Technology.new(:name => name, :shortname => shortname)
      puts technology.inspect
      technology.save
    end

    # Create fake job seekers

    10.times do
      name = Forgery(:name).full_name
      email = Forgery(:email).address
      password = Forgery(:basic).password
      password_confirmation = password

      time = Time.at((2.months.ago.to_f - Time.now.to_f) * rand + Time.now.to_f)

      resource = User.new(:email => email, :password => password, :password_confirmation => password_confirmation)
      resource.rolable = JobSeeker.new(:name => name)

      (1+rand(5)).times do
        resource.rolable.technologies << Technology.random
      end

      resource.save

      puts resource.errors.inspect

    end

    # Create fake employers

    20.times do
      name = Forgery(:name).full_name
      position = Forgery(:name).job_title
      company_name = Forgery(:name).company_name
      num_pars = 1+rand(6)
      company_description = Forgery(:lorem_ipsum).paragraphs(num_pars)
      company_address = Forgery(:jerbs).nor_cities
      latlng = MultiGeocoder.geocode(CGI.escape(company_address))
      location = Location.new
      location.lat = latlng.lat
      location.lng = latlng.lng

      location.save

      email = Forgery(:email).address
      password = Forgery(:basic).password
      password_confirmation = password

      time = Time.at((2.months.ago.to_f - Time.now.to_f) * rand + Time.now.to_f)

      resource = User.new(:email => email, :password => password, :password_confirmation => password_confirmation)
      resource.rolable = Employer.new(:name => name, :position => position,
                                      :company_name => company_name,
                                      :company_description => company_description,
                                      :company_address => company_address,
                                      :location => location)

      # Create 1-4 jobs per employer

      (1+rand(3)).times do
        title = Forgery(:name).job_title
        num_pars = 1+rand(6)
        description = Forgery(:lorem_ipsum).paragraphs(num_pars)
        deadline = (1+rand(24)).weeks.from_now
        positions = 1
        job = Job.new(:title => title, :description => description, :positions => positions, :created_at => time, :deadline => deadline)

        # Add some technologies

        (1+rand(5)).times do
          job.technologies << Technology.random
        end
        resource.rolable.jobs << job
      end


      resource.save

      puts resource.errors.inspect

    end
  end
end
