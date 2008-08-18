class Product < ActiveRecord::Base
  has_many :images, :as => :imageable, :dependent => :destroy, :order => :position
  has_many :assets, :as => :assetable, :dependent => :destroy, :order => :position

  has_many :qualities
  has_many :options, :through => :qualities
  
  has_many :placements
  
  validates_presence_of :sku, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
