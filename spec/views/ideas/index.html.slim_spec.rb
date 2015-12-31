require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    assign(:ideas, [
      Idea.create!(
        :main_problem => "Main Problem",
        :second_problem => "Second Problem",
        :current_solution => "Current Solution",
        :tag_line_pitch => "Tag Line Pitch",
        :high_concept_pitch => "High Concept Pitch",
        :pitch => nil
      ),
      Idea.create!(
        :main_problem => "Main Problem",
        :second_problem => "Second Problem",
        :current_solution => "Current Solution",
        :tag_line_pitch => "Tag Line Pitch",
        :high_concept_pitch => "High Concept Pitch",
        :pitch => nil
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", :text => "Main Problem".to_s, :count => 2
    assert_select "tr>td", :text => "Second Problem".to_s, :count => 2
    assert_select "tr>td", :text => "Current Solution".to_s, :count => 2
    assert_select "tr>td", :text => "Tag Line Pitch".to_s, :count => 2
    assert_select "tr>td", :text => "High Concept Pitch".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
