class ProductsController < ApplicationController
  
  def index
    @pages = Product.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
end
