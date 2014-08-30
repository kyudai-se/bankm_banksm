require "spec_helper"

describe BankmsController do
  describe "routing" do

    it "routes to #index" do
      get("/bankms").should route_to("bankms#index")
    end

    it "routes to #new" do
      get("/bankms/new").should route_to("bankms#new")
    end

    it "routes to #show" do
      get("/bankms/1").should route_to("bankms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bankms/1/edit").should route_to("bankms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bankms").should route_to("bankms#create")
    end

    it "routes to #update" do
      put("/bankms/1").should route_to("bankms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bankms/1").should route_to("bankms#destroy", :id => "1")
    end

  end
end
