require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      instance_double(Book,
        author: "Author",
        title: "Title",
        library: nil,
        status: "Status",
        condition: "Condition",
        to_model: double(
          persisted?: true,
          model_name: double(
            name: "Book",
            singular_route_key: 'book'
          )
        ),
      ),
      instance_double(Book,
        author: "Author",
        title: "Title",
        library: nil,
        status: "Status",
        condition: "Condition",
        to_model: double(
          persisted?: true,
          model_name: double(
            name: "Book",
            singular_route_key: 'book'
          )
        ),
      ),
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
