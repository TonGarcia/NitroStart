require 'rails_helper'

RSpec.describe "start_ups/edit", type: :view do
  before(:each) do
    @start_up = assign(:start_up, StartUp.create!(
      :name => "MyString",
      :brand => "MyString",
      :pitch => nil
    ))
  end

  it "renders the edit start_up form" do
    render

    assert_select "form[action=?][method=?]", start_up_path(@start_up), "post" do

      assert_select "input#start_up_name[name=?]", "start_up[name]"

      assert_select "input#start_up_brand[name=?]", "start_up[brand]"

      assert_select "input#start_up_pitch_id[name=?]", "start_up[pitch_id]"
    end
  end
end
