require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :link => "MyString",
      :visible_attrs => "MyText",
      :body => "MyText"
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input#campaign_link[name=?]", "campaign[link]"

      assert_select "textarea#campaign_visible_attrs[name=?]", "campaign[visible_attrs]"

      assert_select "textarea#campaign_body[name=?]", "campaign[body]"
    end
  end
end
