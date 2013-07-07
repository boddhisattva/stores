require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :contact_no => 1,
      :email_id => "Email",
      :website => "Website",
      :fax_no => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Email/)
    rendered.should match(/Website/)
    rendered.should match(/2/)
  end
end
