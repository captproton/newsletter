require 'cancancan'
module Newsletter
  class ApplicationController < ActionController::Base
    # layout Newsletter.layout
    # render layout: false

    load_and_authorize_resource

    helper :'newsletter/layout'
    # FIX_ME remove fake current_user
    current_user = User.create_or_find_by(first_name: "Carl", last_name: "admin")
  end
end
