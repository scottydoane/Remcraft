class ImagesController < ApplicationController
  before_filter :has_permission?
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
    
  def destroy
    return unless request.delete?
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
end
