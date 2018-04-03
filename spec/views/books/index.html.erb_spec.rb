require 'rails_helper'

RSpec.describe "books/index", type: :view do

  before(:each) do
    assign(:books, [
      instance_double(Book,
        author: "Author",
        title: "Title",
        status: "Status",
        library: nil,
        condition: "Condition"
      ),
      instance_double(Book,
        author: "Author",
        title: "Title",
        status: "Status",
        library: nil,
        condition: "Condition"
      ),
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
