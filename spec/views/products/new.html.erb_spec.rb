require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :division_id => 1,
      :model => "MyString",
      :price => 1.5
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_division_id", :name => "product[division_id]"
      assert_select "input#product_model", :name => "product[model]"
      assert_select "input#product_price", :name => "product[price]"
    end
  end
end
