require 'rails_helper'

RSpec.describe "start_ups/new", type: :view do
  before(:each) do
    assign(:start_up, StartUp.new(
      :name => "MyString",
      :brand => "MyString",
      :pitch => nil
    ))
  end

  it "renders new start_up form" do
    render

    assert_select "form[action=?][method=?]", start_ups_path, "post" do

      assert_select "input#start_up_name[name=?]", "start_up[name]"

      assert_select "input#start_up_brand[name=?]", "start_up[brand]"

      assert_select "input#start_up_pitch_id[name=?]", "start_up[pitch_id]"
    end
  end
end
