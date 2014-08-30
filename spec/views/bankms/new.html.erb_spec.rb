require 'spec_helper'

describe "bankms/new" do
  before(:each) do
    assign(:bankm, stub_model(Bankm).as_new_record)
  end

  it "renders new bankm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bankms_path, "post" do
    end
  end
end
