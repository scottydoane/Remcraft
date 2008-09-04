class Category < ActiveRecord::Base
  has_slug :source_column => :name, :prepend_id => false, :sync_slug => true
  acts_as_category :foreign_key => 'parent_id'
  
  has_many :placements, :order => :position
  has_many :products, :through => :placements, :order => :position
  
  has_many :options
  has_many :customizations, :through => :options
  
end
