require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET #home" do
    it "returns a success response" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET #dashboard" do
    it "does not return a success response" do
      get :dashboard
      expect(response).not_to be_success
    end
  end

end
