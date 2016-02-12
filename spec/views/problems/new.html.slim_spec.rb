require 'rails_helper'

RSpec.describe "problems/new", type: :view do
  before(:each) do
    assign(:problem, Problem.new(
      :description => "MyString",
      :user => nil
    ))
  end

  it "renders new problem form" do
    render

    assert_select "form[action=?][method=?]", problems_path, "post" do

      assert_select "input#problem_description[name=?]", "problem[description]"

      assert_select "input#problem_user_id[name=?]", "problem[user_id]"
    end
  end
end
