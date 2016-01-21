require 'rails_helper'

RSpec.describe "campaigns/new", type: :view do
  before(:each) do
    assign(:campaign, Campaign.new(
      :link => "MyString",
      :visible_attrs => "MyText",
      :body => "MyText"
    ))
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", campaigns_path, "post" do

      assert_select "input#campaign_link[name=?]", "campaign[link]"

      assert_select "textarea#campaign_visible_attrs[name=?]", "campaign[visible_attrs]"

      assert_select "textarea#campaign_body[name=?]", "campaign[body]"
    end
  end
end
