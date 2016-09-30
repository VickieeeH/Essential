require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :record_id => 1,
      :title => "MyText"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_record_id[name=?]", "category[record_id]"

      assert_select "textarea#category_title[name=?]", "category[title]"
    end
  end
end
