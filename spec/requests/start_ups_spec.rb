require 'rails_helper'

RSpec.describe "StartUps", type: :request do
  describe "GET /start_ups" do
    it "works! (now write some real specs)" do
      get start_ups_path
      expect(response).to have_http_status(200)
    end
  end
end
