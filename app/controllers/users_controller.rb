class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end



end
