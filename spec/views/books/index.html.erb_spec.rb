require 'rails_helper'

RSpec.describe "books/index", type: :view do
  let(:library) { FactoryBot.create(:library) }
  let!(:passing_attributes) do
    {
      author:    "Author",
      title:     "Title",
      library:   library,
      status:    "Status",
      condition: "Condition"
    }
  end

  before(:each) do
    assign(:books, [
      FactoryBot.create(:book, passing_attributes),
      FactoryBot.create(:book, passing_attributes)
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
