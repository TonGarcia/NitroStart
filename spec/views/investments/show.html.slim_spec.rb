require 'rails_helper'

RSpec.describe "investments/show", type: :view do
  before(:each) do
    @investment = assign(:investment, Investment.create!(
      :general_terms => 1,
      :raising_time => 2,
      :founder_salaries => "9.99",
      :customer_conversion => "9.99",
      :product_development => "9.99",
      :equipments => "9.99",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
