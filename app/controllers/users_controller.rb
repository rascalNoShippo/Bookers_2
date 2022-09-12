class UsersController < ApplicationController
  def new
  end

  def edit
    @c_user = current_user
    @sidebar = "hidden"
    if User.find(params[:id]) != current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @sidebar = "hidden"
    @c_user = User.find(current_user.id)
    if @c_user.update(user_params)
      flash[:notice] = "Updated the user data successfully."
      redirect_to user_path(current_user.id)
    else
#      @editing_user.attributes = params[:name, :profile_image, :introduction]
      render :edit
    end
  end

  def index
  end
  
  def show
    @user = User.find(params[:id]) #サイドバーでの表示ユーザー
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
