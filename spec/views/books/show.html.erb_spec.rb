require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author => "Author",
      :title => "Title",
      :library => nil,
      :status => "Status",
      :condition => "Condition"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Condition/)
  end
end
