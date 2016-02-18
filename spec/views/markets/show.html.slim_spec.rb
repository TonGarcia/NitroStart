require 'rails_helper'

RSpec.describe "markets/show", type: :view do
  before(:each) do
    @market = assign(:market, Market.create!(
      :total_customers => "",
      :total_money => 1,
      :trends_insight => "Trends Insight",
      :customer_specification => "customer Specification",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Trends Insight/)
    expect(rendered).to match(/customer Specification/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
