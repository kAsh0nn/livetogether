class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def index
  end

  def edit
  end

  def create
  　post = Post.new(post_params)
  　post.save
    redirect_to comments_path
  end

  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
