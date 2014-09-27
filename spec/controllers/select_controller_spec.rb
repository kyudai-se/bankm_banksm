require 'spec_helper'

describe SelectController do

  describe "GET 'select_page'" do
    it "returns http success" do
      get 'select_page'
      response.should be_success
    end
  end

end
