class Product < ActiveRecord::Base
  attr_accessible :division_id, :model, :name, :price, :image
  belongs_to :division, :counter_cache => true
  mount_uploader :image, ImageUploader
end
