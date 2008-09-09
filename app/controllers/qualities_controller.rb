class QualitiesController < ApplicationController
  before_filter :find_polymorphic_object, :except => [ :update, :reorder ]

  def update
    params[:activate] == "1" ? create : destroy
    render :nothing => true
  end
  
  def edit
  
  end
  
  def create
    Quality.create(:product_id => params[:product_id], :customization_id => params[:customization_id])
  end
  
  def destroy
    Quality.find_by_product_id_and_customization_id(params[:product_id], params[:customization_id]).destroy
  end
  
end
