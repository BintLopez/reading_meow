require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do
    assign(:cats, [
      Cat.create!(),
      Cat.create!()
    ])
  end

  it "renders a list of cats" do
    render
  end
end
