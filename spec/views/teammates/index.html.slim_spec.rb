require 'rails_helper'

RSpec.describe "teammates/index", type: :view do
  before(:each) do
    assign(:teammates, [
      Teammate.create!(
        :role => "Role",
        :expertise => "Expertise",
        :contacts => false,
        :team => nil,
        :user => nil
      ),
      Teammate.create!(
        :role => "Role",
        :expertise => "Expertise",
        :contacts => false,
        :team => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of teammates" do
    render
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Expertise".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
