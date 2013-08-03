require 'spec_helper'

describe "divisions/new" do
  before(:each) do
    assign(:division, stub_model(Division,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new division form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => divisions_path, :method => "post" do
      assert_select "input#division_name", :name => "division[name]"
      assert_select "input#division_company_id", :name => "division[company_id]"
    end
  end
end
