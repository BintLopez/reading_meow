require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
  describe "Basic application routing" do

    it "routes to #index" do
      expect(:get => "/home").to route_to("application#home")
    end

  end
end