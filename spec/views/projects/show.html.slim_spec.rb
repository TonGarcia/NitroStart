require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :stage => 1,
      :value_proposition => "Value Proposition",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Value Proposition/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
