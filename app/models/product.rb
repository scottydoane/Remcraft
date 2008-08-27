class Product < ActiveRecord::Base
  has_slug :source_column => :name, :sync_slug => true

  has_many :images, :as => :imageable, :dependent => :destroy, :order => :position
  has_many :assets, :as => :assetable, :dependent => :destroy, :order => :position
  
  has_many :placements
  has_many :categories, :through => :placements
  
  has_many :specifications
  
  validates_presence_of :sku, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
