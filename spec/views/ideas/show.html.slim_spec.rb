require 'rails_helper'

RSpec.describe "ideas/show", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
      :main_problem => "Main Problem",
      :second_problem => "Second Problem",
      :current_solution => "Current Solution",
      :tag_line_pitch => "Tag Line Pitch",
      :high_concept_pitch => "High Concept Pitch",
      :pitch => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Main Problem/)
    expect(rendered).to match(/Second Problem/)
    expect(rendered).to match(/Current Solution/)
    expect(rendered).to match(/Tag Line Pitch/)
    expect(rendered).to match(/High Concept Pitch/)
    expect(rendered).to match(//)
  end
end
