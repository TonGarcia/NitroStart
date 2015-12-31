require 'rails_helper'

RSpec.describe "ideas/new", type: :view do
  before(:each) do
    assign(:idea, Idea.new(
      :main_problem => "MyString",
      :second_problem => "MyString",
      :current_solution => "MyString",
      :tag_line_pitch => "MyString",
      :high_concept_pitch => "MyString",
      :pitch => nil
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "input#idea_main_problem[name=?]", "idea[main_problem]"

      assert_select "input#idea_second_problem[name=?]", "idea[second_problem]"

      assert_select "input#idea_current_solution[name=?]", "idea[current_solution]"

      assert_select "input#idea_tag_line_pitch[name=?]", "idea[tag_line_pitch]"

      assert_select "input#idea_high_concept_pitch[name=?]", "idea[high_concept_pitch]"

      assert_select "input#idea_pitch_id[name=?]", "idea[pitch_id]"
    end
  end
end
