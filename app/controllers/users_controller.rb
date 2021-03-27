class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)

    if new_user.valid?
      session[:user_id] = new_user.id
      redirect_to welcome_path
    else
      flash[:errors] = new_user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
