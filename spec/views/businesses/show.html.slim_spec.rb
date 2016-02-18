require 'rails_helper'

RSpec.describe "businesses/show", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :partnerships => "Partnerships",
      :growth_metrics => "Growth Metrics",
      :customer_success_stories => "customer Success Stories",
      :awards => false,
      :patent => false,
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Partnerships/)
    expect(rendered).to match(/Growth Metrics/)
    expect(rendered).to match(/customer Success Stories/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
