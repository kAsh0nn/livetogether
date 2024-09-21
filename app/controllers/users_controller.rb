class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
        
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
  if @user.update(user_params)
     flash[:notice] =  "You have updated user successfully."
     redirect_to user_path(@user.id)
  else
     render :edit
  end
  end

  def confirm
   @user = User.find(params[:id])
  end
  
  def confirms
   @user = User.find(params[:id])
  @user.update(is_deleted: false)
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to root_path
  end
  
   def user_params
    params.require(:user).permit(:name, :introduction, :title, :boby)
   end
end
