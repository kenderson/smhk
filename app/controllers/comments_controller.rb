class CommentsController < ApplicationController
  before_filter :login_required, :only=>[:show, :edit, :destroy, :update]
  
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  def new
    @post = Post.find(params[:post])
    @comment = Comment.new(:post=>@post)
    respond_to do |format|
      format.html{ render :layout => "facebox"}
    end
  end
  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html{ render :layout => "facebox"}
    end
  end
  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Thank You for your Comment!"
        format.html {redirect_to(@comment.post)}
        format.js
      end
    end
  end
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html {redirect_to (@comment.post)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :layout => "facebox"}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(@comment.post) }
      format.xml  { head :ok }
    end
  end
  
end
