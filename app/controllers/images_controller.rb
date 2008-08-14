class ImagesController < ApplicationController
  
  def create
    if params[:image][:uploaded_data].blank?
      flash[:notice] = "No Image Selected"
      redirect_to :back
    end
    return unless request.post?
    image = Image.new(params[:image])
    object = find_polymorphic_object
    if image.valid?
      object.images.create(params[:image]) 
      flash[:notice] = "#{image.category.titleize} Successfully Added"
      redirect_to :back
    end
  end
  
  private
  
  def find_polymorphic_object
    sections = request.env['REQUEST_URI'].scan(%r{(\w*)/(\d*)}).reverse.reject { |x| x[1] == "" }
    sections.map! { |controller_name, id| [controller_name.singularize.camelize, id] }
    object, id = sections[0]
    eval("#{object}.find(#{id})")    
  end
end
