class Quality < ActiveRecord::Base
  belongs_to :product
  belongs_to :option
end 