class Product < ActiveRecord::Base
  attr_accessible :division_id, :model, :name, :price
  belongs_to :division, :counter_cache => true
end