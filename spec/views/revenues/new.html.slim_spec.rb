require 'rails_helper'

RSpec.describe "revenues/new", type: :view do
  before(:each) do
    assign(:revenue, Revenue.new(
      :price => 1,
      :model => 1,
      :pitch => nil
    ))
  end

  it "renders new revenue form" do
    render

    assert_select "form[action=?][method=?]", revenues_path, "post" do

      assert_select "input#revenue_price[name=?]", "revenue[price]"

      assert_select "input#revenue_model[name=?]", "revenue[model]"

      assert_select "input#revenue_pitch_id[name=?]", "revenue[pitch_id]"
    end
  end
end
