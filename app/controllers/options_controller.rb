class OptionsController < ApplicationController
  before_filter :has_permission?
  before_filter :find_category, :except => [ :destroy, :reorder ]
  
  def new
    @option = Option.new
    @option.customizations.build
  end
  
  def create
    @option = Option.new(params[:option])
    if @category.options.create(params[:option])
      flash[:notice] = "Successfully created option and customizations."
      redirect_to category_options_path(@category)
    else
      render :action => 'new'
    end
  end

  def edit
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    if @option.update_attributes(params[:option])
      flash[:notice] = "Successfully updated option."
      redirect_to category_options_path(@category)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    return unless request.delete?
    option = Option.find(params[:id])
    option.destroy
    redirect_to :back
  end
  
  def reorder
    params[:list].each_with_index do |id, position|
      Option.update(id, :position => position + 1)
    end
    render :update do |page|
      page.visual_effect :highlight, "list"
    end    
  end  
  
  private
  
  def find_category
    @category = Category.find(params[:category_id])
  end
end
