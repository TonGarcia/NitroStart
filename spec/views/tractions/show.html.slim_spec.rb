require 'rails_helper'

RSpec.describe "tractions/show", type: :view do
  before(:each) do
    @traction = assign(:traction, Traction.create!(
      :grow_strategy => "Grow Strategy",
      :growth_rate => "Growth Rate",
      :market_meet_channel => "Market Meet Channel",
      :conversion_rate => "Conversion Rate",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Grow Strategy/)
    expect(rendered).to match(/Growth Rate/)
    expect(rendered).to match(/Market Meet Channel/)
    expect(rendered).to match(/Conversion Rate/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
