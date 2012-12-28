require "spec_helper"

describe SealsController do
  describe "routing" do

    it "routes to #index" do
      get("/seals").should route_to("seals#index")
    end

    it "routes to #new" do
      get("/seals/new").should route_to("seals#new")
    end

    it "routes to #show" do
      get("/seals/1").should route_to("seals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/seals/1/edit").should route_to("seals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/seals").should route_to("seals#create")
    end

    it "routes to #update" do
      put("/seals/1").should route_to("seals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/seals/1").should route_to("seals#destroy", :id => "1")
    end

  end
end
