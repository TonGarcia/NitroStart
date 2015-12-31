require 'rails_helper'

RSpec.describe "Teammates", type: :request do
  describe "GET /teammates" do
    it "works! (now write some real specs)" do
      get teammates_path
      expect(response).to have_http_status(200)
    end
  end
end
