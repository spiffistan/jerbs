class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    # Rails Admin always english
    if self.kind_of? RailsAdmin::ApplicationController
       I18n.locale = :en
    else
       I18n.locale = :nb
    end
  end
end
