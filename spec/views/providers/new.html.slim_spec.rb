require 'rails_helper'

RSpec.describe "providers/new", type: :view do
  before(:each) do
    assign(:provider, Provider.new(
      :name => "MyString",
      :provides => "MyString",
      :pitch => nil,
      :start_up => nil
    ))
  end

  it "renders new provider form" do
    render

    assert_select "form[action=?][method=?]", providers_path, "post" do

      assert_select "input#provider_name[name=?]", "provider[name]"

      assert_select "input#provider_provides[name=?]", "provider[provides]"

      assert_select "input#provider_pitch_id[name=?]", "provider[pitch_id]"

      assert_select "input#provider_start_up_id[name=?]", "provider[start_up_id]"
    end
  end
end
