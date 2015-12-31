require 'rails_helper'

RSpec.describe "markets/edit", type: :view do
  before(:each) do
    @market = assign(:market, Market.create!(
      :total_costumers => "",
      :total_money => 1,
      :trends_insight => "MyString",
      :costumer_specification => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders the edit market form" do
    render

    assert_select "form[action=?][method=?]", market_path(@market), "post" do

      assert_select "input#market_total_costumers[name=?]", "market[total_costumers]"

      assert_select "input#market_total_money[name=?]", "market[total_money]"

      assert_select "input#market_trends_insight[name=?]", "market[trends_insight]"

      assert_select "input#market_costumer_specification[name=?]", "market[costumer_specification]"

      assert_select "input#market_pitch_id[name=?]", "market[pitch_id]"

      assert_select "input#market_start_up_id[name=?]", "market[start_up_id]"
    end
  end
end
