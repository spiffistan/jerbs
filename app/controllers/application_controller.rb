class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    # Rails Admin always english
    I18n.locale = :en if is_a?(RailsAdmin::ApplicationController)
  end
end
