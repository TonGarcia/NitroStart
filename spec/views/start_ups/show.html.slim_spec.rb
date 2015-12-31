require 'rails_helper'

RSpec.describe "start_ups/show", type: :view do
  before(:each) do
    @start_up = assign(:start_up, StartUp.create!(
      :name => "Name",
      :brand => "Brand",
      :pitch => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(//)
  end
end
