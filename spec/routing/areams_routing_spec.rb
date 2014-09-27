require "spec_helper"

describe AreamsController do
  describe "routing" do

    it "routes to #index" do
      get("/areams").should route_to("areams#index")
    end

    it "routes to #new" do
      get("/areams/new").should route_to("areams#new")
    end

    it "routes to #show" do
      get("/areams/1").should route_to("areams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/areams/1/edit").should route_to("areams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/areams").should route_to("areams#create")
    end

    it "routes to #update" do
      put("/areams/1").should route_to("areams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/areams/1").should route_to("areams#destroy", :id => "1")
    end

  end
end
