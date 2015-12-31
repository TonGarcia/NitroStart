require 'rails_helper'

RSpec.describe "revenues/edit", type: :view do
  before(:each) do
    @revenue = assign(:revenue, Revenue.create!(
      :price => 1,
      :model => 1,
      :pitch => nil
    ))
  end

  it "renders the edit revenue form" do
    render

    assert_select "form[action=?][method=?]", revenue_path(@revenue), "post" do

      assert_select "input#revenue_price[name=?]", "revenue[price]"

      assert_select "input#revenue_model[name=?]", "revenue[model]"

      assert_select "input#revenue_pitch_id[name=?]", "revenue[pitch_id]"
    end
  end
end
