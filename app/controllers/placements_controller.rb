class PlacementsController < ApplicationController
  # before_filter :has_permission?
  before_filter :find_polymorphic_object, :except => [ :update, :reorder ]
  
  def update
    params[:activate] == "1" ? create : destroy
    render :nothing => true
  end
  
  def edit
  
  end
  
  def create
    Placement.create(:product_id => params[:product_id], :category_id => params[:category_id])
  end
  
  def destroy
    Placement.find_by_product_id_and_category_id(params[:product_id], params[:category_id]).destroy
  end
  
  def reorder
    params[:list].each_with_index do |id, index|
      Placement.update_all(['position=?', index+1], ['id=?', id])
    end
        
    render :update do |page|
      page.visual_effect :highlight, "list"
    end    
  end  

end
