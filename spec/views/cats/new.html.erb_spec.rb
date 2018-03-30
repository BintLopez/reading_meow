require 'rails_helper'

RSpec.describe "cats/new", type: :view do
  before(:each) do
    assign(:cat, Cat.new())
  end

  it "renders new cat form" do
    render

    assert_select "form[action=?][method=?]", cats_path, "post" do
    end
  end
end
