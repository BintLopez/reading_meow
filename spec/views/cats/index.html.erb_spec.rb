require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do
    assign(:cats, [
      FactoryBot.create(:cat),
      FactoryBot.create(:cat)
    ])
  end

  it "renders a list of cats" do
    render
  end
end
