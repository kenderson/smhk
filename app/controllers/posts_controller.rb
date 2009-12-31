class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  def index
    @posts = Post.ordered
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.json  { render :json => @posts }
      format.atom
    end
  end
  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments.ordered
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :layout => "facebox"}
      format.xml  { render :xml => @post }
    end
  end
  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :layout => "facebox"}
    end
  end
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
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
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
