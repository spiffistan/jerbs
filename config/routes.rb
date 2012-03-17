Jerbs::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # Use custom controller for registrations part
  devise_for :users, :controllers => { :registrations => "registrations" } do
    match 'employer/sign_up' => 'registrations#new', :role => :employer
    match 'job_seeker/sign_up' => 'registrations#new', :role => :job_seeker
  end

  # TODO flesh out
  resources :jobs
  resources :job_seekers
  resources :employers

  match 'jobs/technology/:technology_id' => 'jobs#index_by_technology', :as => :jobs_by_technology, :via => :get
  match 'jobs/find/:query' => 'jobs#search', :as => :job_search, :via => :get

  match '/' => 'home#index', :constraints => { :subdomain => 'www' }
  match '/' => 'employers#show', :constraints => { :subdomain => /.+/ }

  match '/map' => 'home#map', :as => 'map'
  #

  # match 'employers/:company_name' => 'employers#show', :as => 'show_employer', :via => :get

  # custom routes
  #

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
