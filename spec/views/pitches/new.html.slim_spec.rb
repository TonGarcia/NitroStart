require 'rails_helper'

RSpec.describe "pitches/new", type: :view do
  before(:each) do
    assign(:pitch, Pitch.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new pitch form" do
    render

    assert_select "form[action=?][method=?]", pitches_path, "post" do

      assert_select "input#pitch_name[name=?]", "pitch[name]"

      assert_select "input#pitch_user_id[name=?]", "pitch[user_id]"
    end
  end
end
