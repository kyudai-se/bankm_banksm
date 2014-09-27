require 'spec_helper'

describe "areams/index" do
  before(:each) do
    assign(:areams, [
      stub_model(Aream),
      stub_model(Aream)
    ])
  end

  it "renders a list of areams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
