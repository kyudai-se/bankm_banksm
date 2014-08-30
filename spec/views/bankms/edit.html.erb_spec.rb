require 'spec_helper'

describe "bankms/edit" do
  before(:each) do
    @bankm = assign(:bankm, stub_model(Bankm))
  end

  it "renders the edit bankm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bankm_path(@bankm), "post" do
    end
  end
end
