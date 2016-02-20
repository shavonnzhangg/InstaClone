class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  	#collect all posts
  	@posts = Post.all
  end

  def show #show a single post
        @post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	if @post = Post.create(post_params) # create method using data in our fomr
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post could not be created."
      render :new
    end
  end								 # post_params needs to be a private method


  def edit
        @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Successfully deleted"
    else
      flash.now[:alert] = "Deletion unsuccessful."
    end
    redirect_to posts_path
  end

  private

  def post_params									#after create want to redirect user to index
  	params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
