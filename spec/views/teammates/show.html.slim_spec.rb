require 'rails_helper'

RSpec.describe "teammates/show", type: :view do
  before(:each) do
    @teammate = assign(:teammate, Teammate.create!(
      :role => "Role",
      :expertise => "Expertise",
      :contacts => false,
      :team => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Expertise/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
