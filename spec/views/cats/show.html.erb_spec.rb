require 'rails_helper'

RSpec.describe "cats/show", type: :view do
  before(:each) do
    @cat = assign(:cat, FactoryBot.build_stubbed(:cat))
  end

  it "renders attributes in <p>" do
    render
  end
end
