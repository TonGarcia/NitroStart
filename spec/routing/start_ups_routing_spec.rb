require "rails_helper"

RSpec.describe StartUpsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/start_ups").to route_to("start_ups#index")
    end

    it "routes to #new" do
      expect(:get => "/start_ups/new").to route_to("start_ups#new")
    end

    it "routes to #show" do
      expect(:get => "/start_ups/1").to route_to("start_ups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/start_ups/1/edit").to route_to("start_ups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/start_ups").to route_to("start_ups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/start_ups/1").to route_to("start_ups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/start_ups/1").to route_to("start_ups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/start_ups/1").to route_to("start_ups#destroy", :id => "1")
    end

  end
end
