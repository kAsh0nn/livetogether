class CommentsController < ApplicationController
 def new
    @comments = Comment.new
 end
 
 def create
    @comments = Comment.new(comment_params)
    @comments.user_id = current_user.id
    @comments.save!
    redirect_to comments_path
 end
 def index
      @comments = Comment.all
 end

  def show
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
