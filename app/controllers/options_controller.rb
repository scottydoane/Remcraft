class OptionsController < ApplicationController
  before_filter :find_category, :except => [ :destroy ]
  
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
  
  
  private
  
  def find_category
    @category = Category.slugged_find(params[:category_id])
  end
end
