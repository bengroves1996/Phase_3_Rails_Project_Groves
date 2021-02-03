class SessionsController < ApplicationController

  def new
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to root_url

  end 

  def create
    user = User.find_by username: params['session']['username']
   
    if user && user.authenticate(params['session']['password'])
      @current_user = user
      session[:user_id] = user.id
      redirect_to '/sessions/home'
    else
      flash[:notice] = "Username or password is invalid"
      redirect_to '/login'
    end
  end

  def home
    redirect_if_not_logged_in
    @user = current_user.username
  end

  def omniauth
    user = User.create_from_omniauth(auth)
      if user.valid?
        session[:user_id] = user.id
        flash[:notice] = "You have successfully signed in with Google Oauth"
        redirect_to '/sessions/home'
      else
        flash[:messages] = user.errors.full_messages.join(", ")
        redirect_to '/login'
      end
  end 

    private 
    def auth
        request.env['omniauth.auth']
    end
end
