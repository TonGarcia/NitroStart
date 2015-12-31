require "rails_helper"

RSpec.describe FinancialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/financials").to route_to("financials#index")
    end

    it "routes to #new" do
      expect(:get => "/financials/new").to route_to("financials#new")
    end

    it "routes to #show" do
      expect(:get => "/financials/1").to route_to("financials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/financials/1/edit").to route_to("financials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/financials").to route_to("financials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/financials/1").to route_to("financials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/financials/1").to route_to("financials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/financials/1").to route_to("financials#destroy", :id => "1")
    end

  end
end
