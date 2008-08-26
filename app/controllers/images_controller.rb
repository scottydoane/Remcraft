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
    
end
