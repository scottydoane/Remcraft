class SpecificationsController < ApplicationController
  before_filter :has_permission?
  before_filter :find_polymorphic_object, :except => [ :destroy ]
  
  def index
    @specification = Specification.new
    @object = find_polymorphic_object
  end
  
  def create
    return unless request.post?
    @specification = Specification.new(params[:specification])
    if @specification.valid?
      find_polymorphic_object.specifications.create(params[:specification]) 
      flash[:notice] = 'Specification Successfully Added'
      redirect_to :back
    else
      @object = find_polymorphic_object
      render :action => 'index'
    end
  end
  
  def update
    @specification = Specification.find(params[:id])

    respond_to do |format|
      if @specification.update_attributes(params[:specification])
        flash[:notice] = 'Specification was successfully updated.'
        format.html { redirect_to product_specifications_url(params[:product_id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    return unless request.delete?
    @specification = Specification.find(params[:id])
    @specification.destroy
    
    flash[:notice] = 'Sepcification Successfully Removed'
    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
end
