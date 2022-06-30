require 'rails_helper'

RSpec.describe "SecretSauces", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/secret_sauce/index"
      expect(response).to have_http_status(:success)
    end
  end

end
