class UsersController < ApplicationController
  before_filter :has_permission?
  
  def index
    @users = User.find(:all)
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Administrator was successfully updated.'
        format.html { redirect_to edit_user_url(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    # logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      # self.current_user = @user # !! now logged in
      redirect_back_or_default('/users')
      flash[:notice] = "New Administrator successfully created."
    else
      flash[:error]  = "We couldn't set up that account, sorry."
      render :action => 'new'
    end
  end
end
