require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :author => "MyString",
      :title => "MyString",
      :library => nil,
      :status => "MyString",
      :condition => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[library_id]"

      assert_select "input[name=?]", "book[status]"

      assert_select "input[name=?]", "book[condition]"
    end
  end
end
