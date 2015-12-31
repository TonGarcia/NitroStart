require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :pitch => nil,
        :start_up => nil
      ),
      Team.create!(
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
