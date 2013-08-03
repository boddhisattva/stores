class Division < ActiveRecord::Base
  attr_accessible :company_id, :name
  belongs_to :company
  has_many :products
end
