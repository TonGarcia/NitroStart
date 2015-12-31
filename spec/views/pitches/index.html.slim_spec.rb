require 'rails_helper'

RSpec.describe "pitches/index", type: :view do
  before(:each) do
    assign(:pitches, [
      Pitch.create!(
        :name => "Name",
        :user => nil
      ),
      Pitch.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of pitches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
