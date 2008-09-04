module OptionsHelper
  def fields_for_customization(customization, &block)
    prefix = customization.new_record? ? 'new' : 'existing'
    fields_for("option[#{prefix}_customization_attributes][]", customization, &block)
  end

  def add_customization_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :customizations, :partial => 'customization', :object => Customization.new 
    end 
  end
end
