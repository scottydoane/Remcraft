class ImagesController < ApplicationController
  before_filter :find_polymorphic_object
  
  def index
    @object = find_polymorphic_object
  end
  
  def create
    if params[:image][:uploaded_data].blank?
      flash[:error] = "No Image Selected"
      redirect_to :back
    end
    return unless request.post?
    image = Image.new(params[:image])
    if image.valid?
      find_polymorphic_object.images.create(params[:image]) 
      flash[:notice] = 'Image Successfully Added'
      redirect_to :back
    end
  end
  
  private
  
  def find_polymorphic_object
    sections = request.env['REQUEST_URI'].scan(%r{(\w*)/(\d*)}).reverse.reject { |x| x[1] == "" }
    sections.map! { |controller_name, id| [controller_name.singularize.camelize, id] }
    object, id = sections[0]
    eval("@#{object.downcase} = #{object}.find(#{id})")    
  end
  
end
