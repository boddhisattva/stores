class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :division_id
      t.string :model
      t.float :price

      t.timestamps
    end
  end
end
