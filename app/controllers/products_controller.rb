class ProductsController < ApplicationController
  before_filter :has_permission?, :except => [ :show ]
  
  def index
    @products = Product.paginate :page => params[:page], :include => :images, :order => :product_code, :conditions => "type IS NULL OR type = 'Product'"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def show
    @product = Product.find(params[:id], :include => [ :images, :specifications ])
    set_breadcrumb_for @product  
        
    respond_to do |format|
      format.html { render :layout => "public" } # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
  
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to edit_product_url(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to edit_product_url(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def set_breadcrumb_for prod
    add_breadcrumb prod.categories.first.parent.name, "category_path(#{prod.categories.first.parent.id})" unless prod.categories.first.parent.nil?
    add_breadcrumb prod.categories.first.name, "category_path(#{prod.categories.first.id})" unless prod.categories.first.parent
    add_breadcrumb "#{prod.product_code} - #{prod.name}", "product_path(#{prod.id})"
  end
  
end
