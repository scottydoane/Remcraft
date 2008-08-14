class Category < ActiveRecord::Base
  acts_as_category :foreign_key => 'parent_id'
  has_many :products
end
