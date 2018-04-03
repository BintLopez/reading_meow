require 'rails_helper'

RSpec.describe "books/index", type: :view do

  let(:book_double) do
    instance_double(Book,
      author: "Author",
      title: "Title",
      status: "Status",
      library: nil,
      condition: "Condition",
      to_model: double(
        model_name: double(name: 'Book', route_key: 'book'),
        persisted?: nil
      )
    )
  end

  before(:each) do
    assign(:books, [book_double, book_double])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
  end
end
