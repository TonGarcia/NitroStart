require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input#team_pitch_id[name=?]", "team[pitch_id]"

      assert_select "input#team_start_up_id[name=?]", "team[start_up_id]"
    end
  end
end
