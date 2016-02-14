class PostsController < ApplicationController
  
  def index
  	#collect all posts
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(post_params) # create method using data in our fomr
    redirect_to posts_path
  end								 # post_params needs to be a private method

  private

  def post_params									#after create want to redirect user to index
  	params.require(:post).permit(:image, :caption)
  end

end
