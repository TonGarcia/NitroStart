require 'rails_helper'

RSpec.describe "start_ups/index", type: :view do
  before(:each) do
    assign(:start_ups, [
      StartUp.create!(
        :name => "Name",
        :brand => "Brand",
        :pitch => nil
      ),
      StartUp.create!(
        :name => "Name",
        :brand => "Brand",
        :pitch => nil
      )
    ])
  end

  it "renders a list of start_ups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
