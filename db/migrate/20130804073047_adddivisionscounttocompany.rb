class Adddivisionscounttocompany < ActiveRecord::Migration
  def up
    add_column :companies, :divisions_count, :integer, :default => 0
    Company.reset_column_information
    Company.find_each do |each_co|
      each_co.update_attribute :divisions_count, each_co.divisions.length
    end
  end

  def down
    remove_column :companies, :divisions_count
  end
end
