require 'rails_helper'

RSpec.describe "Financials", type: :request do
  describe "GET /financials" do
    it "works! (now write some real specs)" do
      get financials_path
      expect(response).to have_http_status(200)
    end
  end
end
