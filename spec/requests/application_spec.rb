require 'rails_helper'

RSpec.describe "Application", type: :request do
  describe "GET /home" do
    it "successfully gets the home page" do
      get home_path
      expect(response).to have_http_status(200)
    end
  end
end