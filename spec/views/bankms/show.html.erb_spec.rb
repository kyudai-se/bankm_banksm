require 'spec_helper'

describe "bankms/show" do
  before(:each) do
    @bankm = assign(:bankm, stub_model(Bankm))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
