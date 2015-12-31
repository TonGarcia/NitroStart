require 'rails_helper'

RSpec.describe "revenues/index", type: :view do
  before(:each) do
    assign(:revenues, [
      Revenue.create!(
        :price => 1,
        :model => 2,
        :pitch => nil
      ),
      Revenue.create!(
        :price => 1,
        :model => 2,
        :pitch => nil
      )
    ])
  end

  it "renders a list of revenues" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
