require 'rails_helper'

RSpec.describe "teammates/new", type: :view do
  before(:each) do
    assign(:teammate, Teammate.new(
      :role => "MyString",
      :expertise => "MyString",
      :contacts => false,
      :team => nil,
      :user => nil
    ))
  end

  it "renders new teammate form" do
    render

    assert_select "form[action=?][method=?]", teammates_path, "post" do

      assert_select "input#teammate_role[name=?]", "teammate[role]"

      assert_select "input#teammate_expertise[name=?]", "teammate[expertise]"

      assert_select "input#teammate_contacts[name=?]", "teammate[contacts]"

      assert_select "input#teammate_team_id[name=?]", "teammate[team_id]"

      assert_select "input#teammate_user_id[name=?]", "teammate[user_id]"
    end
  end
end
