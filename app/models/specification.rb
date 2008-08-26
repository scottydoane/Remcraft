class Specification < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :name
  validates_presence_of :description
end
