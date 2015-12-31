require 'rails_helper'

RSpec.describe "Revenues", type: :request do
  describe "GET /revenues" do
    it "works! (now write some real specs)" do
      get revenues_path
      expect(response).to have_http_status(200)
    end
  end
end
