require 'rails_helper'

RSpec.describe "application/dashboard", type: :view do

  it "renders the dashboard page content" do
    render
    expect(rendered).to match /only logged in user can access this page/
  end

end


