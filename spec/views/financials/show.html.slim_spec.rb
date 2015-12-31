require 'rails_helper'

RSpec.describe "financials/show", type: :view do
  before(:each) do
    @financial = assign(:financial, Financial.create!(
      :total_costumer => 1,
      :total_revenue => 2,
      :total_expense => 3,
      :conversion_price => 4,
      :market_penetration => 5,
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
