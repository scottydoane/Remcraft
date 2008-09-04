class Customization < ActiveRecord::Base
  belongs_to :option
  validates_presence_of :name
  validates_numericality_of :modifier
  
  attr_accessor :should_destroy

  def should_destroy?
    should_destroy.to_i == 1
  end

end
