require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :stage => 1,
      :value_proposition => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_stage[name=?]", "project[stage]"

      assert_select "input#project_value_proposition[name=?]", "project[value_proposition]"

      assert_select "input#project_pitch_id[name=?]", "project[pitch_id]"

      assert_select "input#project_start_up_id[name=?]", "project[start_up_id]"
    end
  end
end
