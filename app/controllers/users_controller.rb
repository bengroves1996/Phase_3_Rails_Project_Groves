class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/sessions/home'
    else
      flash[:notice] = "Username is taken, and all fields must be filled!"
      render 'new'
    end
  end

  def set_tasker
    current_user
    redirect_to '/sessions/home'
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = current_user
    user.tasker = true
    user.save
    redirect_to '/sessions/home'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :tasker)
  end

end