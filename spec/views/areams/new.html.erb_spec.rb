require 'spec_helper'

describe "areams/new" do
  before(:each) do
    assign(:aream, stub_model(Aream).as_new_record)
  end

  it "renders new aream form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", areams_path, "post" do
    end
  end
end
