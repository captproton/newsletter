require 'cancancan'
module Newsletter
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # layout Newsletter.layout
    # render layout: false

    load_and_authorize_resource

    helper :'newsletter/layout'
  end
end
