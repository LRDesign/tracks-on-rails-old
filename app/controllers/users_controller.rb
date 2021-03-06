class UsersController < ApplicationController
  
  before_filter :require_login
  before_filter :require_admin, :except => [ :edit ]
  
  # GET /users
  # GET /users.xml
  def index    
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
  # render new.rhtml
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless admin_logged_in? or (current_user == @user)
      flash[:error] = "You are not authorized to edit this user"
      redirect_to :back
    end
  end
  
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    respond_to do |format|
      if success && @user.errors.empty?
        # Protects against session fixation attacks, causes request forgery
        # protection if visitor resubmits an earlier form using back
        # button. Uncomment if you understand the tradeoffs.
        # reset session
        self.current_user = @user # !! now logged in
        format.html { redirect_back_or_default('/') }
        flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      else
        flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
        format.html { render :action => 'new' }
      end
    end
  end
end
