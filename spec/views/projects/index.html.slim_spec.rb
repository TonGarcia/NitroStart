require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :stage => 1,
        :value_proposition => "Value Proposition",
        :pitch => nil,
        :start_up => nil
      ),
      Project.create!(
        :stage => 1,
        :value_proposition => "Value Proposition",
        :pitch => nil,
        :start_up => nil
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Value Proposition".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
