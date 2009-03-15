class VariantsController < ApplicationController
  Product
  
  def index
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @variants }
    end
  end
  
  def show
    @variant = Variant.find(params[:id])
    set_breadcrumb_for @variant  
        
    respond_to do |format|
      format.html { render :layout => "public" } # show.html.erb
      format.xml  { render :xml => @variant }
    end
  end
  
  def new
    @variant = Variant.new
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @variant }
    end
  end

  def edit
    @variant = Variant.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def create
    @variant = Variant.new(params[:variant])
    @product = Product.find(params[:product_id])

    respond_to do |format|
      if @product.variants.build(params[:variant])
        @product.variants.create(params[:variant])
        flash[:notice] = 'Variant was successfully created.'
        format.html { redirect_to product_variants_url(@product) }
        format.xml  { render :xml => @variant, :status => :created, :location => @variant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @variant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @variant = Variant.find(params[:id])
    @product = Product.find(params[:product_id])

    respond_to do |format|
      if @variant.update_attributes(params[:variant])
        flash[:notice] = 'Variant was successfully updated.'
        format.html { redirect_to product_variants_url(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @variant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to(product_variants_url(@variant.product)) }
      format.xml  { head :ok }
    end
  end
end
