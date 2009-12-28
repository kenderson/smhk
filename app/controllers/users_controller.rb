class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  # include AuthenticatedSystem
  before_filter :login_required
  # render new.rhtml
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  def new
    @user = User.new
    respond_to do |format|
      format.html{ render :layout => "facebox"}
    end
  end
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html{ render :layout => "facebox"}
    end
  end
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end