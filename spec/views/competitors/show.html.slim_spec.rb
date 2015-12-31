require 'rails_helper'

RSpec.describe "competitors/show", type: :view do
  before(:each) do
    @competitor = assign(:competitor, Competitor.create!(
      :name => "Name",
      :success_story => "Success Story",
      :your_advantage => "Your Advantage",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Success Story/)
    expect(rendered).to match(/Your Advantage/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
