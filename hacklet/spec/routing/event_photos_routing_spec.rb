require "rails_helper"

RSpec.describe EventPhotosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_photos").to route_to("event_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/event_photos/new").to route_to("event_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/event_photos/1").to route_to("event_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_photos/1/edit").to route_to("event_photos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_photos").to route_to("event_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_photos/1").to route_to("event_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_photos/1").to route_to("event_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_photos/1").to route_to("event_photos#destroy", :id => "1")
    end

  end
end
