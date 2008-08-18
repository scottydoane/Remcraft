class PlacementsController < ApplicationController
  before_filter :preload_product
  
  private
  
  def preload_product
    @product = Product.find(params[:product_id])
  end
  

end
