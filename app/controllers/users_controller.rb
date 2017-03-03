class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :bio)
    end

end
