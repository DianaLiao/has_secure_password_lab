class SessionsController < ApplicationController

  def login

  end


  def create
    login_params = params.require(:user).permit(:name, :password)
    @user = User.find_by(name: login_params[:name])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else 
      flash[:message] = "Your username or password was incorrect."
      redirect_to login_path
    #  return head(:forbidden) unless (@user && @user.authenticate(params[:password]))
    end
  end

end
