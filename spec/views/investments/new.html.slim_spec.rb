require 'rails_helper'

RSpec.describe "investments/new", type: :view do
  before(:each) do
    assign(:investment, Investment.new(
      :general_terms => 1,
      :raising_time => 1,
      :founder_salaries => "9.99",
      :costumer_conversion => "9.99",
      :product_development => "9.99",
      :equipments => "9.99",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new investment form" do
    render

    assert_select "form[action=?][method=?]", investments_path, "post" do

      assert_select "input#investment_general_terms[name=?]", "investment[general_terms]"

      assert_select "input#investment_raising_time[name=?]", "investment[raising_time]"

      assert_select "input#investment_founder_salaries[name=?]", "investment[founder_salaries]"

      assert_select "input#investment_costumer_conversion[name=?]", "investment[costumer_conversion]"

      assert_select "input#investment_product_development[name=?]", "investment[product_development]"

      assert_select "input#investment_equipments[name=?]", "investment[equipments]"

      assert_select "input#investment_pitch_id[name=?]", "investment[pitch_id]"

      assert_select "input#investment_start_up_id[name=?]", "investment[start_up_id]"
    end
  end
end
