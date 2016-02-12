require 'rails_helper'

RSpec.describe "problems/edit", type: :view do
  before(:each) do
    @problem = assign(:problem, Problem.create!(
      :description => "MyString",
      :user => nil
    ))
  end

  it "renders the edit problem form" do
    render

    assert_select "form[action=?][method=?]", problem_path(@problem), "post" do

      assert_select "input#problem_description[name=?]", "problem[description]"

      assert_select "input#problem_user_id[name=?]", "problem[user_id]"
    end
  end
end
