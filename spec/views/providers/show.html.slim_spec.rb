require 'rails_helper'

RSpec.describe "providers/show", type: :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!(
      :name => "Name",
      :provides => "Provides",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Provides/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
