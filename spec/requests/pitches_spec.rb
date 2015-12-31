require 'rails_helper'

RSpec.describe "Pitches", type: :request do
  describe "GET /pitches" do
    it "works! (now write some real specs)" do
      get pitches_path
      expect(response).to have_http_status(200)
    end
  end
end
