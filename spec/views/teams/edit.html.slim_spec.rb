require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input#team_pitch_id[name=?]", "team[pitch_id]"

      assert_select "input#team_start_up_id[name=?]", "team[start_up_id]"
    end
  end
end
