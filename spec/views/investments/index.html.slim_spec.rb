require 'rails_helper'

RSpec.describe "investments/index", type: :view do
  before(:each) do
    assign(:investments, [
      Investment.create!(
        :general_terms => 1,
        :raising_time => 2,
        :founder_salaries => "9.99",
        :costumer_conversion => "9.99",
        :product_development => "9.99",
        :equipments => "9.99",
        :pitch => nil,
        :start_up => nil
      ),
      Investment.create!(
        :general_terms => 1,
        :raising_time => 2,
        :founder_salaries => "9.99",
        :costumer_conversion => "9.99",
        :product_development => "9.99",
        :equipments => "9.99",
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of investments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
