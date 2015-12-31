require 'rails_helper'

RSpec.describe "tractions/edit", type: :view do
  before(:each) do
    @traction = assign(:traction, Traction.create!(
      :grow_strategy => "MyString",
      :growth_rate => "MyString",
      :market_meet_channel => "MyString",
      :conversion_rate => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders the edit traction form" do
    render

    assert_select "form[action=?][method=?]", traction_path(@traction), "post" do

      assert_select "input#traction_grow_strategy[name=?]", "traction[grow_strategy]"

      assert_select "input#traction_growth_rate[name=?]", "traction[growth_rate]"

      assert_select "input#traction_market_meet_channel[name=?]", "traction[market_meet_channel]"

      assert_select "input#traction_conversion_rate[name=?]", "traction[conversion_rate]"

      assert_select "input#traction_pitch_id[name=?]", "traction[pitch_id]"

      assert_select "input#traction_start_up_id[name=?]", "traction[start_up_id]"
    end
  end
end
