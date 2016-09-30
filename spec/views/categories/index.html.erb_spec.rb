require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :record_id => 2,
        :title => "MyText"
      ),
      Category.create!(
        :record_id => 2,
        :title => "MyText"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
