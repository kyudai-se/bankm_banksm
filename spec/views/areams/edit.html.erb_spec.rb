require 'spec_helper'

describe "areams/edit" do
  before(:each) do
    @aream = assign(:aream, stub_model(Aream))
  end

  it "renders the edit aream form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aream_path(@aream), "post" do
    end
  end
end
