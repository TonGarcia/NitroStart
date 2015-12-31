require 'rails_helper'

RSpec.describe "teammates/edit", type: :view do
  before(:each) do
    @teammate = assign(:teammate, Teammate.create!(
      :role => "MyString",
      :expertise => "MyString",
      :contacts => false,
      :team => nil,
      :user => nil
    ))
  end

  it "renders the edit teammate form" do
    render

    assert_select "form[action=?][method=?]", teammate_path(@teammate), "post" do

      assert_select "input#teammate_role[name=?]", "teammate[role]"

      assert_select "input#teammate_expertise[name=?]", "teammate[expertise]"

      assert_select "input#teammate_contacts[name=?]", "teammate[contacts]"

      assert_select "input#teammate_team_id[name=?]", "teammate[team_id]"

      assert_select "input#teammate_user_id[name=?]", "teammate[user_id]"
    end
  end
end
