require "rails_helper"

RSpec.describe TeammatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/teammates").to route_to("teammates#index")
    end

    it "routes to #new" do
      expect(:get => "/teammates/new").to route_to("teammates#new")
    end

    it "routes to #show" do
      expect(:get => "/teammates/1").to route_to("teammates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/teammates/1/edit").to route_to("teammates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/teammates").to route_to("teammates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/teammates/1").to route_to("teammates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/teammates/1").to route_to("teammates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teammates/1").to route_to("teammates#destroy", :id => "1")
    end

  end
end
