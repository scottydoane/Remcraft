class Option < ActiveRecord::Base
  has_many :customizations, :dependent => :destroy
  
  validates_presence_of :name
  validates_associated :customizations
  
  def customization_attributes=(customization_attributes)
    customization_attributes.each do |attributes|
      if attributes[:id].blank?
        customizations.build(attributes)
      else
        customization = customizations.detect { |t| t.id == attributes[:id].to_i }
        customization.attributes = attributes
      end
    end
  end

  def save_customizations
    customizations.each do |t|
      if t.should_destroy?
        t.destroy
      else
        t.save(false)
      end
    end
  end

end
