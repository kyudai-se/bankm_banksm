require 'spec_helper'

describe "areams/show" do
  before(:each) do
    @aream = assign(:aream, stub_model(Aream))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
