require 'rails_helper'

RSpec.describe "devise/registrations/new", type: :view do

  it "renders the correct sign up form" do
    render
    expect(rendered).to match /a cat who wants some books!/
  end

end
