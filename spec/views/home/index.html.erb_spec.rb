require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
	before { render }

  it "renders the expected content on the home page" do
  	expect(rendered).to match /Welcome to Reading Meow/
  end

  it "displays sign up link on the home page" do
  	expect(rendered).to match /Sign Up/
  end

  it "displays log in link on the home page" do
  	expect(rendered).to match /Log In/
  end
end