class Category < ActiveRecord::Base
  acts_as_category :foreign_key => 'parent_id'
  
  has_many :placements, :order => :position
  has_many :products, :through => :placements, :order => :position
  
end
