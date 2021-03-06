class Company < ActiveRecord::Base
  attr_accessible :contact_no, :email_id, :fax_no, :name, :website, :divisions_count
  has_many :divisions
  has_many :products, :through => :divisions
end
