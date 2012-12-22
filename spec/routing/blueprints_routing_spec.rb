require "spec_helper"

describe BlueprintsController do
  describe "routing" do

    it "routes to #index" do
      get("/blueprints").should route_to("blueprints#index")
    end

    it "routes to #new" do
      get("/blueprints/new").should route_to("blueprints#new")
    end

    it "routes to #show" do
      get("/blueprints/1").should route_to("blueprints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blueprints/1/edit").should route_to("blueprints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blueprints").should route_to("blueprints#create")
    end

    it "routes to #update" do
      put("/blueprints/1").should route_to("blueprints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blueprints/1").should route_to("blueprints#destroy", :id => "1")
    end

  end
end
