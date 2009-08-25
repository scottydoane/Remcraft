module VariantsHelper
  
  def variant_identifier(object)
    content_tag(:h3, "#{object.product.name} - #{object.name}")
  end
end
