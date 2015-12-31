require 'rails_helper'

RSpec.describe "competitors/index", type: :view do
  before(:each) do
    assign(:competitors, [
      Competitor.create!(
        :name => "Name",
        :success_story => "Success Story",
        :your_advantage => "Your Advantage",
        :pitch => nil,
        :start_up => nil
      ),
      Competitor.create!(
        :name => "Name",
        :success_story => "Success Story",
        :your_advantage => "Your Advantage",
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of competitors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Success Story".to_s, :count => 2
    assert_select "tr>td", :text => "Your Advantage".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
