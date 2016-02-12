require 'rails_helper'

RSpec.describe "problems/show", type: :view do
  before(:each) do
    @problem = assign(:problem, Problem.create!(
      :description => "Description",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
