require "rails_helper"

RSpec.describe TractionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tractions").to route_to("tractions#index")
    end

    it "routes to #new" do
      expect(:get => "/tractions/new").to route_to("tractions#new")
    end

    it "routes to #show" do
      expect(:get => "/tractions/1").to route_to("tractions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tractions/1/edit").to route_to("tractions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tractions").to route_to("tractions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tractions/1").to route_to("tractions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tractions/1").to route_to("tractions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tractions/1").to route_to("tractions#destroy", :id => "1")
    end

  end
end
