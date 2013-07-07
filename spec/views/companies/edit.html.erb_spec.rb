require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :contact_no => 1,
      :email_id => "MyString",
      :website => "MyString",
      :fax_no => 1
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "input#company_contact_no", :name => "company[contact_no]"
      assert_select "input#company_email_id", :name => "company[email_id]"
      assert_select "input#company_website", :name => "company[website]"
      assert_select "input#company_fax_no", :name => "company[fax_no]"
    end
  end
end
