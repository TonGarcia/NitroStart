require 'rails_helper'

RSpec.describe "competitors/edit", type: :view do
  before(:each) do
    @competitor = assign(:competitor, Competitor.create!(
      :name => "MyString",
      :success_story => "MyString",
      :your_advantage => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders the edit competitor form" do
    render

    assert_select "form[action=?][method=?]", competitor_path(@competitor), "post" do

      assert_select "input#competitor_name[name=?]", "competitor[name]"

      assert_select "input#competitor_success_story[name=?]", "competitor[success_story]"

      assert_select "input#competitor_your_advantage[name=?]", "competitor[your_advantage]"

      assert_select "input#competitor_pitch_id[name=?]", "competitor[pitch_id]"

      assert_select "input#competitor_start_up_id[name=?]", "competitor[start_up_id]"
    end
  end
end
