require 'rails_helper'

RSpec.describe "markets/index", type: :view do
  before(:each) do
    assign(:markets, [
      Market.create!(
        :total_customers => "",
        :total_money => 1,
        :trends_insight => "Trends Insight",
        :customer_specification => "customer Specification",
        :pitch => nil,
        :start_up => nil
      ),
      Market.create!(
        :total_customers => "",
        :total_money => 1,
        :trends_insight => "Trends Insight",
        :customer_specification => "customer Specification",
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of markets" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Trends Insight".to_s, :count => 2
    assert_select "tr>td", :text => "customer Specification".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
