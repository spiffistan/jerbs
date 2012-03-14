require 'forgery'

namespace :db do
  desc 'Fill database with fake data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    100.times do
      name = Forgery(:name).full_name
      position = Forgery(:name).job_title
      company_name = Forgery(:name).company_name
      company_description = Forgery(:lorem_ipsum).paragraphs
      company_address = Forgery(:address).street_address

      email = Forgery(:email).address
      password = Forgery(:basic).password
      password_confirmation = password

      resource = User.new(:email => email, :password => password, :password_confirmation => password_confirmation)
      resource.rolable = Employer.new(:name => name, :position => position, :company_name => company_name,
                                      :company_description => company_description, :company_address => company_address)

      (1+rand(3)).times do
        title = Forgery(:name).job_title
        description = Forgery(:lorem_ipsum).paragraphs
        positions = 1
        resource.rolable.jobs << Job.new(:title => title, :description => description, :positions => positions)
      end

      puts resource.inspect

      resource.save

    end
  end
end
