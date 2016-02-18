require 'rails_helper'

RSpec.describe "businesses/edit", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :partnerships => "MyString",
      :growth_metrics => "MyString",
      :customer_success_stories => "MyString",
      :awards => false,
      :patent => false,
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input#business_partnerships[name=?]", "business[partnerships]"

      assert_select "input#business_growth_metrics[name=?]", "business[growth_metrics]"

      assert_select "input#business_customer_success_stories[name=?]", "business[customer_success_stories]"

      assert_select "input#business_awards[name=?]", "business[awards]"

      assert_select "input#business_patent[name=?]", "business[patent]"

      assert_select "input#business_pitch_id[name=?]", "business[pitch_id]"

      assert_select "input#business_start_up_id[name=?]", "business[start_up_id]"
    end
  end
end
