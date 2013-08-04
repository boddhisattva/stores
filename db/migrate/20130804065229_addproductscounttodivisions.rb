class Addproductscounttodivisions < ActiveRecord::Migration
  def up
    add_column :divisions, :products_count, :integer, :default => 0
    Division.reset_column_information
    Division.find_each do |each_div|
      each_div.update_attribute :products_count, Product.find_all_by_division_id(each_div.id).count
    end
  end

  def down
    remove_column :divisions, :products_count
  end
end
