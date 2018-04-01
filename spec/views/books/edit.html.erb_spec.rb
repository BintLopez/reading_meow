require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, FactoryBot.create(:book))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[library_id]"

      assert_select "input[name=?]", "book[status]"

      assert_select "input[name=?]", "book[condition]"
    end
  end
end
