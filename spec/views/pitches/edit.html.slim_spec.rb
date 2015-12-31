require 'rails_helper'

RSpec.describe "pitches/edit", type: :view do
  before(:each) do
    @pitch = assign(:pitch, Pitch.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit pitch form" do
    render

    assert_select "form[action=?][method=?]", pitch_path(@pitch), "post" do

      assert_select "input#pitch_name[name=?]", "pitch[name]"

      assert_select "input#pitch_user_id[name=?]", "pitch[user_id]"
    end
  end
end
