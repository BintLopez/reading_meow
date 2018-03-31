require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do
    assign(:cats, [
      FactoryBot.build_stubbed(:cat),
      FactoryBot.build_stubbed(:cat)
    ])
  end

  it "renders a list of cats" do
    render
  end
end
