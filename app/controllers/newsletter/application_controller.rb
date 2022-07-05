require 'cancancan'
module Newsletter
  class ApplicationController < ActionController::Base
    # layout Newsletter.layout
    # render layout: false

    load_and_authorize_resource

    helper :'newsletter/layout'
  end
end
