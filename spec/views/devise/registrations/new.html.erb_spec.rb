require 'rails_helper'

RSpec.describe "devise/registrations/new", type: :view do
	it "displays the sign up title" do
		render
		expect(rendered).to include("Sign Up")
	end

  it "renders the correct sign up form" do
    render
    expect(rendered).to match /a cat who wants some books!/
  end

  it "renders the text and link to login to an existing account" do
  	render
  	expect(rendered).to match /Already have an account?/
  	expect(rendered).to include('<a href="/login">Log In</a>')
  end

end
