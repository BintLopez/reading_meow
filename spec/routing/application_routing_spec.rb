require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
  describe "Basic application routing" do

    it "routes to #index" do
      expect(:get => "/home").to route_to("application#home")
    end

    it "routes to #dashboard" do
      expect(:get => "/dashboard").to route_to("application#dashboard")
    end

    it "routes to new user sign up" do
      expect(:get => "/register").to route_to("devise/registrations#new")
    end

    it "routes to user log in" do
      expect(:get => "/login").to route_to("devise/sessions#new")
    end

    it "routes to user edit" do
      expect(:get => "/settings").to route_to("devise/registrations#edit")
    end

    it "routes to user logout" do
      expect(:delete => "/logout").to route_to("devise/sessions#destroy")
    end
  end
end
