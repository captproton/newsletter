require 'rails_helper'

# Change this MoviesController to your project
RSpec.describe MoviesController, type: :controller do

    login_user
    let(:valid_session) { {} }
    # This should return the minimal set of attributes required to create a valid
    # Movie. As you add validations to Movie, be sure to adjust the attributes here as well.
    let(:valid_attributes) {
        { :title => "Test title!", :storyline => "This is a test storyline", :director => "Jonus" }
    }

    describe "GET #index" do
        it "returns a success response" do
            Movie.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end
end
