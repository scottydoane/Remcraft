class AssetsController < ApplicationController
  before_filter :find_polymorphic_object
  
  def index
    @object = find_polymorphic_object
  end
  
  def create
    if params[:asset][:uploaded_data].blank?
      flash[:error] = "No Asset Selected"
      redirect_to :back
    end
    return unless request.post?
    asset = Asset.new(params[:asset])
    if asset.valid?
      find_polymorphic_object.assets.create(params[:asset]) 
      flash[:notice] = 'Asset Successfully Added'
      redirect_to :back
    end
  end
end
