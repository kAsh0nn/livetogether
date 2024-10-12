class CommentsController < ApplicationController
 def new
    @comments = Comment.new
 end
 
 def create
    @comments = Comment.new(comment_params)
    @comments.user_id = current_user.id
    @comments.save
    redirect_to comments_path
 end
 def index
      @comments = Comment.all
 end

  def show
  end
  
  def edit
     @comments = Comment.find(params[:id])
  end
  
  def update
     @comments = Comment.find(params[:id])
  if @comments.update(comment_params)
     flash[:notice] =  "You have updated comments successfully."
     redirect_to comments_path
  else
     render :edit
  end
  end
  def destroy
    comments = Comment.find(params[:id]) 
    comments.destroy 
    redirect_to comments_path
  end 
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
