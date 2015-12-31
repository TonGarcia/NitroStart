require 'rails_helper'

RSpec.describe "pitches/show", type: :view do
  before(:each) do
    @pitch = assign(:pitch, Pitch.create!(
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
