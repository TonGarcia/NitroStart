require "rails_helper"

RSpec.describe RevenuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/revenues").to route_to("revenues#index")
    end

    it "routes to #new" do
      expect(:get => "/revenues/new").to route_to("revenues#new")
    end

    it "routes to #show" do
      expect(:get => "/revenues/1").to route_to("revenues#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/revenues/1/edit").to route_to("revenues#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/revenues").to route_to("revenues#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/revenues/1").to route_to("revenues#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/revenues/1").to route_to("revenues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/revenues/1").to route_to("revenues#destroy", :id => "1")
    end

  end
end
