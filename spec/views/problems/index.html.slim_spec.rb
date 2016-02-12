require 'rails_helper'

RSpec.describe "problems/index", type: :view do
  before(:each) do
    assign(:problems, [
      Problem.create!(
        :description => "Description",
        :user => nil
      ),
      Problem.create!(
        :description => "Description",
        :user => nil
      )
    ])
  end

  it "renders a list of problems" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
