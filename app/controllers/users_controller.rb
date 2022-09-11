class UsersController < ApplicationController
  def new
  end

  def edit
    @sidebar = "hidden"
  end
  
  def update
    @sidebar = "hidden"
    @c_user = User.find(current_user.id)
    @c_user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def index
  end
  
  def show
    @user = User.find(params[:id]) #サイドバーでの表示ユーザー
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :prof_image)
  end
  
end
