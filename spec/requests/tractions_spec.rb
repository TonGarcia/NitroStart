require 'rails_helper'

RSpec.describe "Tractions", type: :request do
  describe "GET /tractions" do
    it "works! (now write some real specs)" do
      get tractions_path
      expect(response).to have_http_status(200)
    end
  end
end
