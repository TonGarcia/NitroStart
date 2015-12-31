require 'rails_helper'

RSpec.describe "businesses/index", type: :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :partnerships => "Partnerships",
        :growth_metrics => "Growth Metrics",
        :costumer_success_stories => "Costumer Success Stories",
        :awards => false,
        :patent => false,
        :pitch => nil,
        :start_up => nil
      ),
      Business.create!(
        :partnerships => "Partnerships",
        :growth_metrics => "Growth Metrics",
        :costumer_success_stories => "Costumer Success Stories",
        :awards => false,
        :patent => false,
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => "Partnerships".to_s, :count => 2
    assert_select "tr>td", :text => "Growth Metrics".to_s, :count => 2
    assert_select "tr>td", :text => "Costumer Success Stories".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
