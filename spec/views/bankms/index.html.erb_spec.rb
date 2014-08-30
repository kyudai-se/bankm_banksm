require 'spec_helper'

describe "bankms/index" do
  before(:each) do
    assign(:bankms, [
      stub_model(Bankm),
      stub_model(Bankm)
    ])
  end

  it "renders a list of bankms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
