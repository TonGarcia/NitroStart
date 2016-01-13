require 'rails_helper'

RSpec.describe "financials/index", type: :view do
  before(:each) do
    assign(:financials, [
      Financial.create!(
        :total_costumers => 1,
        :total_revenue => 2,
        :total_expense => 3,
        :conversion_price => 4,
        :market_penetration => 5,
        :pitch => nil,
        :start_up => nil
      ),
      Financial.create!(
        :total_costumers => 1,
        :total_revenue => 2,
        :total_expense => 3,
        :conversion_price => 4,
        :market_penetration => 5,
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of financials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
