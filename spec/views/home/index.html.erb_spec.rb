require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do

  it "renders the expected content on the home page" do
  	render

  	expect(rendered).to match /Welcome to Reading Meow/
  end
end


