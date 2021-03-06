class CategoriesController < ApplicationController
  before_filter :has_permission?, :except => [ :show ]
  
  def index
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml    { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id], :include => [{ :products  => :images }])
    set_breadcrumb_for @category  
        
    respond_to do |format|
      format.html { render :layout => "public" } # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  def print
    @category = Category.find(params[:id], :include => [{ :products  => :images }])
    set_breadcrumb_for @category  
        
    respond_to do |format|
      format.html { render :layout => "print" } # print.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(categories_url) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to categories_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  def update_positions
    Category.update_positions(params)
    render :nothing => true
  end
  
  private
  def set_breadcrumb_for cat
    set_breadcrumb_for cat.parent if cat.parent
    add_breadcrumb cat.name, "category_path(#{cat.id})"
  end
  
end
