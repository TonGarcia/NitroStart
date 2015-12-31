require 'rails_helper'

RSpec.describe "competitors/new", type: :view do
  before(:each) do
    assign(:competitor, Competitor.new(
      :name => "MyString",
      :success_story => "MyString",
      :your_advantage => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new competitor form" do
    render

    assert_select "form[action=?][method=?]", competitors_path, "post" do

      assert_select "input#competitor_name[name=?]", "competitor[name]"

      assert_select "input#competitor_success_story[name=?]", "competitor[success_story]"

      assert_select "input#competitor_your_advantage[name=?]", "competitor[your_advantage]"

      assert_select "input#competitor_pitch_id[name=?]", "competitor[pitch_id]"

      assert_select "input#competitor_start_up_id[name=?]", "competitor[start_up_id]"
    end
  end
end
