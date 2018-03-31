require 'rails_helper'

RSpec.describe "application/home", type: :view do

  it "renders the home page content" do
    render
    expect(rendered).to match /Welcome to Reading Meow/
  end

end


