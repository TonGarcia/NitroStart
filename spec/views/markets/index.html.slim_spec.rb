require 'rails_helper'

RSpec.describe "markets/index", type: :view do
  before(:each) do
    assign(:markets, [
      Market.create!(
        :total_costumers => "",
        :total_money => 1,
        :trends_insight => "Trends Insight",
        :costumer_specification => "Costumer Specification",
        :pitch => nil,
        :start_up => nil
      ),
      Market.create!(
        :total_costumers => "",
        :total_money => 1,
        :trends_insight => "Trends Insight",
        :costumer_specification => "Costumer Specification",
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
    assert_select "tr>td", :text => "Costumer Specification".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
