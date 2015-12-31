require 'rails_helper'

RSpec.describe "revenues/show", type: :view do
  before(:each) do
    @revenue = assign(:revenue, Revenue.create!(
      :price => 1,
      :model => 2,
      :pitch => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
