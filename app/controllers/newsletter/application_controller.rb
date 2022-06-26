require 'cancancan'
module Newsletter
  class ApplicationController < ActionController::Base
    layout Newsletter.layout
    load_and_authorize_resource

    helper :'newsletter/layout'

  end
end
