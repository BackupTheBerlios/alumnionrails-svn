# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'gettext/rails'

class ApplicationController < ActionController::Base
  init_gettext "alumnionrails", "UTF-8"
end