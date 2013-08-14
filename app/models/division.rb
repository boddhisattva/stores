class Division < ActiveRecord::Base
  attr_accessible :company_id, :name, :products_count
  belongs_to :company, :counter_cache => true
  has_many :products
end
