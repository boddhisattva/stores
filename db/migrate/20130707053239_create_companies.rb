class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :contact_no
      t.string :email_id
      t.string :website
      t.integer :fax_no

      t.timestamps
    end
  end
end
