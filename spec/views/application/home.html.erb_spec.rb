require 'rails_helper'

RSpec.describe "application/home", type: :view do

  it "renders the home page content" do
    render
    expect(rendered).to match /Welcome to Reading Meow/
  end

  it "renders the new account sign up form" do
  	render
  	expect(rendered).to include("I have a library card and want to bring the gift of reading to cats!")
  end
end