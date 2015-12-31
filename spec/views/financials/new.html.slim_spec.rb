require 'rails_helper'

RSpec.describe "financials/new", type: :view do
  before(:each) do
    assign(:financial, Financial.new(
      :total_costumer => 1,
      :total_revenue => 1,
      :total_expense => 1,
      :conversion_price => 1,
      :market_penetration => 1,
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new financial form" do
    render

    assert_select "form[action=?][method=?]", financials_path, "post" do

      assert_select "input#financial_total_costumer[name=?]", "financial[total_costumer]"

      assert_select "input#financial_total_revenue[name=?]", "financial[total_revenue]"

      assert_select "input#financial_total_expense[name=?]", "financial[total_expense]"

      assert_select "input#financial_conversion_price[name=?]", "financial[conversion_price]"

      assert_select "input#financial_market_penetration[name=?]", "financial[market_penetration]"

      assert_select "input#financial_pitch_id[name=?]", "financial[pitch_id]"

      assert_select "input#financial_start_up_id[name=?]", "financial[start_up_id]"
    end
  end
end
