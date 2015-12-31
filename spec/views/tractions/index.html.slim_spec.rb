require 'rails_helper'

RSpec.describe "tractions/index", type: :view do
  before(:each) do
    assign(:tractions, [
      Traction.create!(
        :grow_strategy => "Grow Strategy",
        :growth_rate => "Growth Rate",
        :market_meet_channel => "Market Meet Channel",
        :conversion_rate => "Conversion Rate",
        :pitch => nil,
        :start_up => nil
      ),
      Traction.create!(
        :grow_strategy => "Grow Strategy",
        :growth_rate => "Growth Rate",
        :market_meet_channel => "Market Meet Channel",
        :conversion_rate => "Conversion Rate",
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of tractions" do
    render
    assert_select "tr>td", :text => "Grow Strategy".to_s, :count => 2
    assert_select "tr>td", :text => "Growth Rate".to_s, :count => 2
    assert_select "tr>td", :text => "Market Meet Channel".to_s, :count => 2
    assert_select "tr>td", :text => "Conversion Rate".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
